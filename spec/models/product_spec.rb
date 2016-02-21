require 'rails_helper'

RSpec.describe Product, type: :model do
	let(:product1) {Product.create(name: "Vintage 1950s Suit", url: "https://www.etsy.com/listing/268532087/vintage-1950s-suit-red-and-black-50s?ref=shop_home_active_1")}

	describe 'attributes' do
		it 'has a name' do
			expect(product1.name).to eq("Vintage 1950s Suit")
		end
		it 'has a url' do
			expect(product1.url).to eq("https://www.etsy.com/listing/268532087/vintage-1950s-suit-red-and-black-50s?ref=shop_home_active_1")
		end
	end

end
