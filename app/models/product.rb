class Product < ActiveRecord::Base
  has_one :measurement, as: :measurable, dependent: :destroy
  accepts_nested_attributes_for :measurement
end
