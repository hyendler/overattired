class Product < ActiveRecord::Base
  has_one :measurement, as: :measurable, dependent: :destroy
end
