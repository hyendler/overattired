class UserMeasurement < ActiveRecord::Base
	belongs_to :user
	validates :gender, presence: true
	validate :correct_gender_measurements

	def correct_gender_measurements
		if gender == "female"
			if hips.blank?
				errors.add(:hips, 'We need your hips measurement!')
			end
			if waist.blank?
				errors.add(:hips, 'We need your hips measurment!')
			end
			if bust.blank?
				errors.add(:bust, 'We need your bust measurment!')
			end
		elsif gender == "male"
			if waist.blank?
				errors.add(:waist, 'We need your waist measurement!')
			end
			if chest.blank?
				errors.add(:chest, 'We need your chest measurment!')
			end
			if inseam.blank?
				errors.add(:inseam, 'We need your inseam measurment!')
			end
		end
	end
	# validates :hips, presence :true, if "gender == 'female'"
	# validates :bust
	# validates :waist
	# validates :chest
	# validates :inseam
end
