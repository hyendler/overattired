class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :measurement, as: :measurable, dependent: :destroy

  # before_action :authenticate_user!

  	def querying(unit, range, gender)

		value = self.measurement[unit]

		matched_products = Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where("measurements.gender" => gender).where(["measurements.#{unit} >= ? AND measurements.#{unit} <= ?", value, value + range])
	end

	def match
		gender = self.measurement.gender

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

end


