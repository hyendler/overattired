require 'rails_helper'

RSpec.describe Product, type: :model do
	let(:product1) {Product.create(title: "Vintage 1950s Suit", url: "https://www.etsy.com/listing/268532087/vintage-1950s-suit-red-and-black-50s?ref=shop_home_active_1")}

  let(:product_dupe_url) {Product.create(title: "Great 1950s Suit", url: "https://www.etsy.com/listing/268532087/vintage-1950s-suit-red-and-black-50s?ref=shop_home_active_1")}

  let(:product_no_title) {Product.new(url: "https://www.etsy.com/listing/268532087/vintage-1950s-suit-red-and-black-50s?ref=shop_home_active_1")}

  let(:product_no_url) {Product.new(title: "Vintage 1950s Suit")}

	describe 'attributes' do
    context 'with valid input' do
  		it 'has a title' do
  			expect(product1.title).to eq("Vintage 1950s Suit")
  		end
  		it 'has a url' do
  			expect(product1.url).to eq("https://www.etsy.com/listing/268532087/vintage-1950s-suit-red-and-black-50s?ref=shop_home_active_1")
  		end
    end
    context 'with missing input' do
      it 'raises an error without a title' do
        product_no_title.save
        expect(product_no_title.errors[:title]).to include("can't be blank")
      end
      it 'raises and error without a url' do
        product_no_url.save
        expect(product_no_url.errors[:url]).to include("can't be blank")
      end
    end
    context 'with duplicate product url' do
      it 'does not persist in the database if the url is already in the database' do
        product1.save
        product_dupe_url.save
        expect(product_dupe_url.errors[:url]).to include("has already been taken")
      end
    end
	end

	describe 'associations' do
    it 'should have one measurement' do
      t = Product.reflect_on_association(:measurement)
      t.macro.should == :has_one
    end
  end

end
