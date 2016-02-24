require 'net/http'
require 'json'

# def count_listings(data)
#   p data["results"].length
# end

#PARSING PRODUCT DATA
def parse_title(listing)
  p "******************************"
  p listing
  p "******************************"
  whole_title = listing["title"]
  p whole_title
  title_array = whole_title.split(/\|/)
end

def parse_category(listing)
  category_path = listing["category_path"]
  category_path.last
end

def description_parse(listing)
  description = listing["description"]
  description.split(/^(.*?)(?=Measurements)/).first.gsub("\n",' ')
end

def parse_image(listing)
  listing["MainImage"]["url_fullxfull"]
end

# PARSING MEASUREMENT DATA
def parse_measurement(listing, unit)
  description = listing["description"]
  description_match = description.match(/(?<=#{unit}:)(.\d*)/)
  if description_match != nil
    return description_match[0].strip.to_f
  end
end

def parse_length(listing)
  description = listing["description"]
  if description.include?("Overall Length")
     description_match = description.match(/(?<=Overall Length:)(.\d*)/)
  elsif description.include?("Length")
     description_match = description.match(/(?<=Length:)(.\d*)/)
  end

  if description_match != nil
    return description_match[0].strip.to_f
  end
end

def parse_sleeves(listing)
  description = listing["description"]
  if description.include?("Overall Length")
     description_match = description.match(/(?<=Sleeve Length:)(.\d*)/)
  elsif description.include?("Length")
     description_match = description.match(/(?<=Sleeves:)(.\d*)/)
  end

  if description_match != nil
    return description_match[0].strip.to_f
  end
end

def parse_gender(listing)
  category_path = listing["category_path"]
  if category_path.include? "Men"
    return "male"
  else
    return "female"
  end
end

# request all products (200 max) in OverAttired Vintage Shop, Include Main Image url
# save first url with 100 listing limit (offset = 0)
# save second url with 100 listing limit (offset of 100 listings)

def scrape_etsy(url)
  data = Net::HTTP.get(url)
  parsed_data = JSON(data)
  # count_listings(parsed_data)
  return parsed_data
end

# CALL THIS METHOD IN CONTROLLER TO STORE NEW PRODUCTS
def store_data_from_etsy
  # delete all products from database
  Product.delete_all
  # (see note above re offsets)
  offset_array = ["offset=0", "offset=100"]
  # iterate through offset_array to call etsy API and store parse data into JSON
  offset_array.each do |offset|
    url = URI("https://openapi.etsy.com/v2/shops/10849718/listings/active?includes=MainImage&limit=100&#{offset}&api_key=#{ENV["ETSY_KEYSTRING"]}")
    # call etsy api
    parsed_data = scrape_etsy(url)
    # iterate through parsed JSON and store product and measurement
    parsed_data["results"].each do |listing|
      save_product(listing)
    end
  end
end

def save_product(listing)
  product = Product.new
  # save product title (possibly also subtitle and generic size)
  title_array = parse_title(listing)
  if title_array.length == 3
    # store title, subtitle and size
    product.title = parse_title(listing)[0].strip
    product.subtitle = parse_title(listing)[1].strip
    product.size = parse_title(listing)[2].strip
  elsif title_array.length == 2
    # store title and subtitle
    product.title = parse_title(listing)[0].strip
    product.subtitle = parse_title(listing)[1].strip
  else
    # store title only
    product.title = parse_title(listing)[0].strip
  end
  # save additional attributes
  product.price = listing["price"]
  product.when_made = listing["when_made"]
  product.description = description_parse(listing)
  product.category = parse_category(listing)
  product.url = listing["url"]
  product.image_url = parse_image(listing)
  # if the product saves, also save its measurement
  if product.save
    save_measurement(listing) ? product.measurement = save_measurement(listing) : false
  end
end

def save_measurement(listing)
  measurement = Measurement.new
  # save measurement attributes
  measurement.bust = parse_measurement(listing, "Bust")
  measurement.shoulders = parse_measurement(listing, "Shoulders")
  measurement.waist = parse_measurement(listing, "Waist")
  measurement.chest = parse_measurement(listing, "Chest")
  measurement.inseam = parse_measurement(listing, "Inseam")
  measurement.overall_length = parse_length(listing)
  measurement.hips = parse_measurement(listing, "Hips")
  measurement.sleeve_length = parse_sleeves(listing)
  measurement.gender = parse_gender(listing)
  # if the measurement can save, return it so we can store it to the product in save_product
  measurement.save ? measurement : false
end
