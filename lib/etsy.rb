require 'net/http'
require 'json'

# def count_listings(data)
#   p data["results"].length
# end

def scrape_etsy
  # request all products (150 limit) in OverAttired Vintage Shop, Include Main Image url
  url = URI("https://openapi.etsy.com/v2/shops/10849718/listings/active?includes=MainImage&limit=150&api_key=#{ENV["ETSY_KEYSTRING"]}")
  data = Net::HTTP.get(url)
  parsed_data = JSON(data)
  count_listings(parsed_data)
  return parsed_data
end

#PARSING PRODUCT DATA
def parse_title(listing)
  whole_title = listing["title"]
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

def store_data_from_etsy
  measurement = Measurement.new

  parsed_data = scrape_etsy

  parsed_data["results"].each do |listing|
    product = Product.new

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

    product.price = listing["price"]
    product.when_made = listing["when_made"]
    product.description = description_parse(listing)
    product.category = parse_category(listing)
    product.url = listing["url"]
    product.image_url = parse_image(listing)

    if product.save
      #add measurement
      measurement = Measurement.new
      measurement.bust = parse_measurement(listing, "Bust")
      measurement.shoulders = parse_measurement(listing, "Shoulders")
      measurement.waist = parse_measurement(listing, "Waist")
      measurement.chest = parse_measurement(listing, "Chest")
      measurement.inseam = parse_measurement(listing, "Inseam")
      measurement.overall_length = parse_length(listing)
      measurement.hips = parse_measurement(listing, "Hips")
      measurement.sleeve_length = parse_sleeves(listing)
      measurement.gender = parse_gender(listing)

      if measurement.save
        product.measurement = measurement
      end
    end
  end
end






# def store_data_from_etsy

#   DATA["results"].each do |listing|
#     bust = parse_measurement(listing, "Bust")
#     shoulders = parse_measurement(listing, "Shoulders")
#     waist = parse_measurement(listing, "Waist")
#     chest = parse_measurement(listing, "Chest")
#     inseam = parse_measurement(listing, "Inseam")
#     overall_length = parse_length(listing)
#     hips = parse_measurement(listing, "Hips")
#     sleeve_length = parse_sleeves(listing)
#     gender = parse_gender(listing)

#   end

# end














