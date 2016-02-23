require 'net/http'
require 'json'

# uri = URI("https://openapi.etsy.com/v2/listings/active?api_key=#{ENV["ETSY_KEYSTRING"]}")
# data = Net::HTTP.get(uri)

def scrape_etsy
  # request all products (150 limit) in OverAttired Vintage Shop, Include Main Image url
  url = URI("https://openapi.etsy.com/v2/shops/10849718/listings/active?includes=MainImage&limit=50&api_key=#{ENV["ETSY_KEYSTRING"]}")
  data = Net::HTTP.get(url)
  parsed_data = JSON(data)
end

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

def store_data_from_etsy
  # measurement = Measurement.new

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

    product.save
  end

end
