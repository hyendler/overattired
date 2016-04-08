require 'rails_helper.rb'

describe 'sign up registration page layout' do
  it 'prompts the user to sign up' do
  	visit 'users/sign_up'
  	page.should have_content('Sign up')
  end

   it 'tells users what information is needed' do
  	visit 'users/sign_up'
  	page.should have_content('First name')
  	page.should have_content('Last name')
  	page.should have_content('Email')
  	page.should have_content('Password')
  	page.should have_content('Password confirmation')
  end

  it 'includes a log in button' do
  	visit 'users/sign_up'
  	page.should have_content('Log in')
  end

  it 'includes a Privacy Policy link' do
  	visit 'users/sign_up'
  	page.should have_content('Privacy Policy')
  end
end

describe 'sign up form text inputs' do
  it 'should have the text input fields' do
  	visit 'users/sign_up'
    expect(page).to have_css('input[type="text"]')
  end

  it 'should have the password fields' do
  	visit 'users/sign_up'
    expect(page).to have_css('input[type="password"]')
  end

  # it 'should have a submit button' do
  # 	visit 'users/sign_up'
  #   expect(page).to have_css('input[method="create"]')
  # end
end

describe 'filling out the sign up page form' do
  it 'allows the user to fill out form with characters' do
  	visit 'users/sign_up'
  	fill_in('First name', :with => 'Regina')
  	# page.should have_css "input[name='first_name']"
  	fill_in('Last name', :with => 'Wong')
  	fill_in('Email', :with => 'regina@email.com')
  	fill_in('Password', :with => '12345678')
  	fill_in('Password confirmation', :with => '12345678')
  	click_button 'Sign up'
  	expect(page).to have_content('Logout')
  end
end