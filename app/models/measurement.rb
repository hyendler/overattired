class Measurement < ActiveRecord::Base
	belongs_to :measurable, polymorphic: true

  validates :gender, presence: true
end
