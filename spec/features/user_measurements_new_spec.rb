require 'rails_helper.rb'

describe 'receiving the new-user-measurements page' do
  before :all do
    visit 'users/sign_up'
  	fill_in('First name', :with => 'Regina')
  	fill_in('Last name', :with => 'Wong')
  	fill_in('Email', :with => 'regina@email.com')
  	fill_in('Password', :with => '12345678')
  	fill_in('Password confirmation', :with => '12345678')
  	click_button 'Sign up'
  end

  it 'should be on the new-user-measurements page' do
  	expect(page).to have_content 'Measurements'
  end
end

#start using Factory Girl from here on out to create faux objects that don't permit to the database"
