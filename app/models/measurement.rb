class Measurement < ActiveRecord::Base
	belongs_to :measurable, polymorphic: true

  validates :gender, presence: true
  validates :gender, :inclusion => {:in => %w(male female), :message => "Please select female or male"}

  # validates :hips, :bust, :waist, :shoulders, :presence => true, :if => :gender_is_female?

  # validates :waist, :shoulders, :chest, :inseam, :presence => true, :if => :gender_is_male?

  # validates :hips, :waist, :bust, :chest, :inseam, numericality: true

  # def gender_is_male?
  #   self.gender == "male"
  # end

  # def gender_is_female?
  #   self.gender == "female"
  # end

end
