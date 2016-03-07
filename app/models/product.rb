class Product < ActiveRecord::Base
  has_one :measurement, foreign_key: "product_id", class_name: "ProductMeasurement", dependent: :destroy
  has_many :users #should have many users through matches
  # accepts_nested_attributes_for :measurement
  validates :url, uniqueness: true
  validates :title, :url, presence: true

  # Possible Pseudocode for valid urls
  # validate :valid_urls

  # def valid_urls
  #   valid_url("url", self.url) && valid_url("url", self.image_url)
  # end

  # private

  # def valid_url(attribute, value)
  #   unless value =~ /\A#{URI::regexp(['http', 'https'])}\z/
  #     self.errors[attribute] << (options[:message] || "is not a valid url")
  #   end
  # end

end
