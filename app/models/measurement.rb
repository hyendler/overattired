class Measurement < ActiveRecord::Base
	belongs_to :measurable, polymorphic: true

	# check for male or female
	# if female, get user's waist measurement
	# 	query all products that are for female and have waist measurement that is the same or up to two inches above
	# 	return those products
	# else get user's chest measurement
	# 	pull all products that are for male and have chest measurement that is the same or up to two inches above
	# 	return those products

	def match
		
	end


end
