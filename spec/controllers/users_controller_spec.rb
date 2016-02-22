require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	let(:user1){User.create(first_name: "Lindsey", last_name: "Stevens", email: "lindsey@gmail.com", password: "12345678")}
  let(:user2){User.create(first_name: "Hello", last_name: "Kitty", email: "hellokitty1@gmail.com", password: "12345678")}
	  describe '#update' do
 
      it 'updates an existing useron the server side' do
      	p user2
      	testing = User.last
      	p testing
        put :update, id: testing.id, first_name: "Pokemon", last_name: "Master"
        p testing
        expect(user3.first_name).to eq("Pokemon")
        # expect(user3.last_name).to eq("Master")
      end

      # it 'redirects to the newly updated user' do
      #   put :update, id: user3.id, first_name: "Pokemon", last_name: "Master"
      #   response.should redirect_to User.last
      # end
    end
end
