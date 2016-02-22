class Measurement < ActiveRecord::Base
	belongs_to :measurable, polymorphic: true

  validates :gender, presence: true
  # validates :hips, :waist, :bust, :chest, :inseam, numericality: true
  # validate :required_measurements, :measurement_is_a_number

  # def required_measurements
  #   if gender is male - if gender is female
  # end

  # def measurement_is_a_number
  #   case
  # end

end
