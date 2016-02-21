require 'rails_helper'

RSpec.describe User, type: :model do
  let(:form_no_first_name) {User.new(last_name: 'Calvo')}
  let(:form_no_last_name)  {User.new(first_name: 'Ovi')}
  let(:form)  {User.new(first_name: 'Ovi', last_name: 'Calvo')}

  describe 'validations' do
  	context 'will raise an error' do
  	  it 'when the first_name field is empty' do
  	    form_no_first_name.save
  	    expect(form_no_first_name.errors[:first_name]).to
  	      include("can't be blank")
  	  end
  	  it 'when the last_name field is empty' do
  	  	form_no_last_name.save
  	  	expect(form_no_last_name).errors[:last_name]).to
		  include("can't be blank")
	  end
	end
	it 'saves the user when the fields are not blank' do
	  expect{form.save}.to change{User.count}.by(1)
	end
  end
end
