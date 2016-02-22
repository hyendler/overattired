require 'rails_helper'

RSpec.describe Measurement, type: :model do
  let(:product_measurement1) {Measurement.create(measurable_type: Product, measurable_id: 1, gender: "female", hips: 41, waist: 29, bust: 38)}
  let(:product) {Product.create(name: "Vintage 1950s Suit", url: "https://www.etsy.com/listing/268532087/vintage-1950s-suit-red-and-black-50s?ref=shop_home_active_1")}

  let(:user_measurement1) {Measurement.create(measurable_type: User, measurable_id: 3, gender: "male" , waist: 30, chest: 42, inseam: 31)}
  let(:user) {User.create(first_name: "Ovi", last_name: "Calvin", email: "ovi@gmail.com", password: "12345678")}

  describe 'attributes' do
  	context 'for a male user' do
	  it 'has a gender' do
	  	expect(user_measurement1).to have_attributes(:gender => "male")
	  end
	  it 'has an inseam' do
	  	expect(user_measurement1).to have_attributes(:inseam => 31)
	  end
	  it 'has an chest' do
	  	expect(user_measurement1).to have_attributes(:chest => 42)
	  end
	  it 'has an waist' do
	  	expect(user_measurement1).to have_attributes(:waist => 30)
	  end
	end

	context 'for a female product' do
	  it 'has a gender' do
	  	expect(product_measurement1).to have_attributes(:gender => "female")
	  end
	  it 'has an hips' do
	  	expect(product_measurement1).to have_attributes(:hips => 41)
	  end
	  it 'has an bust' do
	  	expect(product_measurement1).to have_attributes(:bust => 38)
	  end
	  it 'has an waist' do
	  	expect(product_measurement1).to have_attributes(:waist => 29)
	  end
	end
  end


end