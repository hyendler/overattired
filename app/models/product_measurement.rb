class ProductMeasurement < ActiveRecord::Base
	belongs_to :product
	validates :gender, presence: true
end
