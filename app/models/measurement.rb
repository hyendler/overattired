class Measurement < ActiveRecord::Base
	belongs_to :measurable, polymorphic: true

  validates :gender, presence: true
  validates :hips, :waist, :bust, :chest, :inseam, numericality: true
  # validate :required_measurements

  # def required_measurements

  # end
end
