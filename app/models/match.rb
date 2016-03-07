class Match < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :user_id, :uniqueness => { :scope => :product_id }
end
