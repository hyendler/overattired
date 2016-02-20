class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :measurement, as: :measurable, dependent: :destroy
  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  	# check if user male or female
	# if female, get user's waist measurement
	# 	query all products that are for female and have waist measurement that is the same or up to two inches above
	# 	return those products
	# else get user's chest measurement
	# 	pull all products that are for male and have chest measurement that is the same or up to two inches above
	# 	return those products

	def match
		if self.gender == "female"
			waist = self.measurement.waist
			Product.find(:all, :joins => "INNER JOIN products ON products.id = measurements.measurable.id", :conditions => ["waist >= ? AND waist <= ?", waist, waist + 2])
		end
		
	end
end



			# Product.all(:conditions => "waist >= ? AND waist <= ?", waist, waist + 2)