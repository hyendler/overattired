class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :measurement, as: :measurable, dependent: :destroy

 #  	def querying(unit, range, gender)

	# 	value = self.measurement[unit]

	# 	matched_products = Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where("measurements.gender" => gender).where(["measurements.#{unit} >= ? AND measurements.#{unit} <= ?", value, value + range])
	# end

	def match_dresses(waist, bust, hips)
		Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where(category: "Dress").where(["measurements.waist >= ? AND measurements.waist <= ?", waist - 1, waist + 2]).where(["measurements.bust >= ? AND measurements.bust <= ?", bust - 1, bust + 2]).where(["(measurements.hips >= ? AND measurements.hips <= ?) OR measurements.hips IS NULL", hips - 1, hips + 2])
	end

	#NOTE: category on product is saved as a string Pants, but called trousers everywhere else in the code
	#match on waist and hips
	def match_trousers(waist, lower_string, lower_value, gender)
		Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where("measurements.gender" => gender).where(category: "Pants").where(["measurements.waist >= ? AND measurements.waist <= ?", waist - 1, waist + 2]).where(["(measurements.#{lower_string} >= ? AND measurements.#{lower_string} <= ?) OR measurements.#{lower_string} IS NULL", lower_value - 1, lower_value + 2])
	end

	#match on bust, shoulders
	#NOTE: what if user shoulders does not exist - also current method might just work is user shoulders is null
	def match_tops(upper_string, upper_value, shoulders, gender)
		Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where("measurements.gender" => gender).where("category = ? OR category = ?", "Sweater", "Shirt").where(["measurements.#{upper_string} >= ? AND measurements.#{upper_string} <= ?", upper_value - 1.0, upper_value + 2.0]).where(["(measurements.shoulders >= ? AND measurements.shoulders <= ?) OR measurements.shoulders IS NULL", shoulders - 1.0, shoulders + 2.0])
	end

	def match_skirts(waist, hips)
		Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where(category: "Skirt").where(["measurements.waist >= ? AND measurements.waist <= ?", waist - 1, waist + 2]).where(["(measurements.hips >= ? AND measurements.hips <= ?) OR measurements.hips IS NULL", hips - 1, hips + 2])
	end

	# maybe match on waist?
	def match_jackets(upper_string, upper_value, shoulders, gender)
		p upper_string
		p upper_value
		p shoulders
		p gender
		Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where("measurements.gender" => gender).where(category: "Jacket").where(["measurements.#{upper_string} >= ? AND measurements.#{upper_string} <= ?", upper_value - 1, upper_value + 2]).where(["(measurements.shoulders >= ? AND measurements.shoulders <= ?) OR measurements.shoulders IS NULL", shoulders - 1, shoulders + 2])
	end

	# need to come back to the issue of suits
	def match
		gender = self.measurement.gender
		matched_products = {dresses: {}, skirts: {}, trousers: {}, tops: {}, jackets: {}}

		if gender == "female"
			waist = self.measurement.waist
			bust = self.measurement.bust
			shoulders = self.measurement.shoulders
			hips = self.measurement.hips

			matched_products[:dresses] = match_dresses(waist, bust, hips)
			matched_products[:skirts] = match_skirts(waist, hips)
			matched_products[:trousers] = match_trousers(waist, "hips", hips, gender)
			matched_products[:tops] = match_tops("bust", bust, shoulders, gender)
			matched_products[:jackets] = match_jackets("bust", bust, shoulders, gender)
		else #gender will be male
			waist = self.measurement.waist
			chest = self.measurement.chest
			inseam = self.measurement.inseam
			shoulders = self.measurement.shoulders

			matched_products[:trousers] = match_trousers(waist, "inseam", inseam, gender)
			matched_products[:tops] = match_tops("chest", chest, shoulders, gender)
			matched_products[:jackets] = match_jackets("chest", chest, shoulders, gender)

		end

		return matched_products
	end

end

#flatten


