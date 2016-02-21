require 'rails_helper'

RSpec.describe User, type: :model do
  let(:form_no_first_name) {User.new(last_name: 'Calvo', email:'ovi@gmail.com', password: '12345678')}
  let(:form_no_last_name)  {User.new(first_name: 'Ovi', email:'ovi@gmail.com', password: '12345678')}
  let(:form_no_email)  {User.new(first_name: 'Ovi', last_name: 'Calvo', password: '12345678')}
  let(:form_no_password)  {User.new(first_name: 'Ovi', last_name: 'Calvo', email: 'ovi@gmail.com')}

  let(:form)  {User.new(id: 1, first_name: 'Ovi', last_name: 'Calvo', email: 'ovi@gmail.com', password: '12345678')}
  let(:measurement_for_form) {Measurement.create(gender: "male", chest: 30, measurable_type: "User", measurable_id: 1)}

  let(:product)  {Product.create(name: "Vintage 1950s Jacket", url: "https://www.etsy.com/listing/268514567/vintage-1950s-jacket-mulberry-wool?ref=shop_home_active_6")}
  
  let(:measurement_for_product) {Measurement.create(gender: "male", chest: 31, measurable_type: "Product", measurable_id: 2)}

  describe 'validations' do
  	context 'will raise an error' do
  	  it 'when the first_name field is empty' do
  	    form_no_first_name.save
  	    expect(form_no_first_name.errors[:first_name]).to include("can't be blank")
  	  end
  	  it 'when the last_name field is empty' do
  	  	form_no_last_name.save
  	  	expect(form_no_last_name.errors[:last_name]).to include("can't be blank")
	  end
      it 'when the email field is empty' do
  	  	form_no_email.save
  	  	expect(form_no_email.errors[:email]).to include("can't be blank")
	  end
	  it 'when the password field is empty' do
  	  	form_no_password.save
  	  	expect(form_no_password.errors[:password]).to include("can't be blank")
	  end
	end
	it 'saves the user when the fields are not blank' do
	  expect{form.save}.to change{User.count}.by(1)
	end
  end

  describe 'associations' do
  	it 'should have one measurement' do
  		t = User.reflect_on_association(:measurement)
    	t.macro.should == :has_one
  	end
  end

  describe 'instance method' do
  	context 'for the match method'
  	it 'should return array of matched products' do
  		form.match  
  	


  	end
  end

end
