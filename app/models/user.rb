class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # before_action :authenticate_user!

	def match
		gender = self.gender

		if gender == "female"
			unit = "waist"
			range = 2

			matched_products = querying(unit, range, gender)

		else #gender will be male
			unit = "chest"
			range = 2

			matched_products = querying(unit, range, gender)

		end

		return matched_products
	end

	def querying(unit, range, gender)

		value = self[unit]

		matched_products = Product.where(gender: gender).where(["#{unit} >= ? AND #{unit} <= ?", value, value + range])

	end
end


