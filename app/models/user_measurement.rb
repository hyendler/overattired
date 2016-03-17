class UserMeasurement < ActiveRecord::Base
	belongs_to :user
	validates :gender, presence: true
	validate :correct_gender_measurements

	def correct_gender_measurements
		if gender == "female"
			if hips.blank? || bust.blank? || waist.blank?
				errors.add(:hips, 'Attend to all measurements!')
			end
		elsif gender == "male"
			if waist.blank? || chest.blank? || inseam.blank?
				errors.add('Attend to all measurements!')
			end
		end
	end
	# validates :hips, presence :true, if "gender == 'female'"
	# validates :bust
	# validates :waist
	# validates :chest
	# validates :inseam
end
