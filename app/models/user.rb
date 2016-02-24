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




	# match on Waist/Bust
	# want to match on hip, but need to take care of hip free issue
	def match_dress(waist, bust)
		Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where(category: "Dress").where(["measurements.waist >= ? AND measurements.waist <= ?", waist - 1, waist + 2]).where(["measurements.bust >= ? AND measurements.bust <= ?", bust - 1, bust + 2])
	end

	#NOTE: category on product is saved as a string Pants, but called trousers everywhere else in the code
	def match_trousers(waist, hips)
		Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where(category: "Pants").where(["measurements.waist >= ? AND measurements.waist <= ?", waist - 1, waist + 2]).where(["measurements.hip >= ? AND measurements.hips <= ?", hips - 1, hips + 2])
	end

	#match on bust, shoulders
	#NOTE: what if user shoulders does not exist
	def match_tops(bust, shoulders)
		Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where("measurements.gender" => gender).where("category = ? OR category = ?", "Sweater", "Shirt").where(["measurements.bust >= ? AND measurements.bust <= ?", bust - 1, bust + 2]).where(["(measurements.shoulders >= ? AND measurements.shoulders <= ?) OR measurements.shoulders IS NULL", shoulders - 1, shoulders + 2])
	end

	def match_skirts(waist, hips)
		Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where(category: "Skirt").where(["measurements.waist >= ? AND measurements.waist <= ?", waist - 1, waist + 2]).where(["(measurements.hips >= ? AND measurements.hips <= ?) OR measurements.hips IS NULL", hips - 1, hips + 2])
	end

	# maybe match on waist?
	def match_jackets(bust, shoulders)
		Product.joins("INNER JOIN measurements ON measurements.measurable_id = products.id AND measurements.measurable_type = 'Product'").where("measurements.gender" => gender).where(category: "Jacket").where(["measurements.bust >= ? AND measurements.bust <= ?", bust - 1, bust + 2]).where(["(measurements.shoulders >= ? AND measurements.shoulders <= ?) OR measurements.shoulders IS NULL", shoulders - 1, shoulders + 2])
	end

	def match
		gender = self.measurement.gender
		matched_products = {dresses: nil, trousers: nil, tops: nil, skirts: nil, jackets: nil}

		if gender == "female"
			waist = self.measurement.waist
			bust = self.measurement.bust
			shoulders = self.measurement.shoulders
			hips = self.measurement.hips

			matched_products.dresses = match_dresses(waist, bust)
			matched_products.trousers = match_trousers(waist, hips)
			matched_products.tops = match_tops(bust, shoulders)
			matched_products.skirts = match_skirts(waist, hips)
			matched_products.jackets = match_jackets(bust, shoulders)
		else #gender will be male
			waist = self.measurement.waist
			chest = self.measurement.chest
			inseam = self.measurement.inseam
			shoulders = self.measurement.shoulders
		end

		return matched_products
	end

end

#flatten


