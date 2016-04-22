class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :measurement, foreign_key: "user_id", class_name: "UserMeasurement", dependent: :destroy
  has_many :matches

	def match_dresses(waist, bust, hips)
		Product.joins("INNER JOIN product_measurements ON product_measurements.product_id = products.id").where(category: "Dress").where(["product_measurements.waist >= ? AND product_measurements.waist <= ?", waist - 1, waist + 2]).where(["product_measurements.bust >= ? AND product_measurements.bust <= ?", bust - 1, bust + 2]).where(["(product_measurements.hips >= ? AND product_measurements.hips <= ?) OR product_measurements.hips IS NULL", hips - 1, hips + 2])
	end

	#NOTE: category on product is saved as a string Pants, but called trousers everywhere else in the code
	#match on waist for both women and men, and lower_value is hips for women and inseam for men
	def match_trousers(waist, lower_string, lower_value, gender)
		Product.joins("INNER JOIN product_measurements ON product_measurements.product_id = products.id").where("product_measurements.gender" => gender).where(category: "Pants").where(["product_measurements.waist >= ? AND product_measurements.waist <= ?", waist - 1, waist + 2]).where(["(product_measurements.#{lower_string} >= ? AND product_measurements.#{lower_string} <= ?) OR product_measurements.#{lower_string} IS NULL", lower_value - 1, lower_value + 2])
	end

	#match on bust for women, chest for men
	def match_tops(upper_string, upper_value, gender)
		Product.joins("INNER JOIN product_measurements ON product_measurements.product_id = products.id").where("product_measurements.gender" => gender).where("category = ? OR category = ? OR category = ?", "Sweater", "Shirt", "Blouse").where(["product_measurements.#{upper_string} >= ? AND product_measurements.#{upper_string} <= ?", upper_value - 1.0, upper_value + 2.0])
	end

	def match_skirts(waist, hips)
		Product.joins("INNER JOIN product_measurements ON product_measurements.product_id = products.id").where(category: "Skirt").where(["product_measurements.waist >= ? AND product_measurements.waist <= ?", waist - 1, waist + 2]).where(["(product_measurements.hips >= ? AND product_measurements.hips <= ?) OR product_measurements.hips IS NULL", hips - 1, hips + 2])
	end

	# maybe match on waist?
	def match_jackets(upper_string, upper_value, gender)
		Product.joins("INNER JOIN product_measurements ON product_measurements.product_id = products.id").where("product_measurements.gender" => gender).where(category: "Jacket").where(["product_measurements.#{upper_string} >= ? AND product_measurements.#{upper_string} <= ?", upper_value - 1, upper_value + 2])
	end

	# again - maybe match on waist?
	def match_suits(upper_string, upper_value, gender)
		Product.joins("INNER JOIN product_measurements ON product_measurements.product_id = products.id").where("product_measurements.gender" => gender).where(category: "Suits").where(["product_measurements.#{upper_string} >= ? AND product_measurements.#{upper_string} <= ?", upper_value -1, upper_value + 2])
	end

	# returns HASH where key is the Product Category and value is an array of Product objects
	# e.g. {jackets: [product#1, product#4], suits: [product#6, product#9]}
	def match
		gender = self.measurement.gender
		matched_products = {}

		if gender == "female"
			waist = self.measurement.waist
			bust = self.measurement.bust
			hips = self.measurement.hips

			if match_dresses(waist, bust, hips)[0]
				matched_products[:dresses] = match_dresses(waist, bust, hips)
			end

			if match_skirts(waist, hips)[0]
				matched_products[:skirts] = match_skirts(waist, hips)
			end

			if match_trousers(waist, "hips", hips, gender)[0]
				matched_products[:trousers] = match_trousers(waist, "hips", hips, gender)
			end

			if match_tops("bust", bust, gender)[0]
				matched_products[:tops] = match_tops("bust", bust, gender)
			end

			if match_jackets("bust", bust, gender)[0]
				matched_products[:jackets] = match_jackets("bust", bust, gender)
			end

		else #gender will be male
			waist = self.measurement.waist
			chest = self.measurement.chest
			inseam = self.measurement.inseam

			if match_trousers(waist, "inseam", inseam, gender)[0]
				matched_products[:trousers] = match_trousers(waist, "inseam", inseam, gender)
			end

			if match_tops("chest", chest, gender)[0]
				matched_products[:tops] = match_tops("chest", chest, gender)
			end

			if match_jackets("chest", chest, gender)[0]
				matched_products[:jackets] = match_jackets("chest", chest, gender)
			end

			if match_suits("chest", chest, gender)[0]
				matched_products[:suits] = match_suits("chest", chest, gender)
			end
		end

		return matched_products
	end

	# call this method in welcome_email template
	def get_initial_matches
		initial_matches_hash = self.match
		# save each match to matches table
		if !initial_matches_hash.empty?
			initial_matches_hash.each_value do |products_array|
				products_array.each do |product|
					Match.create(product_id: product.id, user_id: self.id, emailed: true, emailed_date_time: DateTime.now)
				end
			end
		end
		return initial_matches_hash
	end

	# call this method in weekly_match_email template
	# returns a hash of matches, same format as #match method
	# note: difference between product matches, and Match model
	def get_new_matches
		# need an array of user's matches via algorithm
		all_product_matches_array = self.match_hash_flatten
		new_product_matches_array = []
		#array of old matches (in MATCH class)
		matches = self.matches

		# iterate through all the users Matches
		all_product_matches_array.each do |product|
			# if all_matches_array for this user DOES NOT include the product of this match
			# then push that product into the new_product_matches_array
			if !matches.include?(Match.find_by(product_id: product.id, user_id: self.id))
				new_product_matches_array.push(product)
			end
		end

		# now iterate over the new_product_matches_array and save each instance in the Match table
		new_product_matches_array.each do |product|
			match = Match.create(product_id: product.id, user_id: self.id, emailed: true, emailed_date_time: DateTime.now)
		end

		#reformat new_product_matches_array into hash in order to send it to email in the data format
		final = match_array_to_hash(new_product_matches_array)
		return final

	end

	def match_hash_flatten
		# self.match will include ALL product matches, new and old ones
		# also, all_matches_hash is in the format of {"skirts" => [products, etc], "jackets" => [products, etc]}
		all_matches_hash = self.match
		all_matches_array = all_matches_hash.values.flatten!
		return all_matches_array
	end

	def match_array_to_hash(array)
		conversion_hash = { "Dress" => :dresses,  "Skirt" => :skirts, "Jacket" => :jackets, "Blouse" => :tops, "Sweater" => :tops, "Shirt" => :tops, "Suits" => :suits, "Pants" => :trousers}
		hash = array.group_by { |product| product.category }
		hash = hash.map {|key, value| [conversion_hash[key], value] }.to_h
		return hash
	end

end
