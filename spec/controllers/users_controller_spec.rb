require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user2){User.create(first_name: "Hello", last_name: "Kitty", email: "hellokitty1@gmail.com", password: "12345678")}
	  
	  describe '#update' do
	  	let(:first_name){"Pokemon"}
      let(:last_name){"Master"}
      it 'updates an existing user on the server side' do
        put :update, id: user2.id, user: { first_name: first_name, last_name: last_name }
        expect(user2.reload.first_name).to eq("Pokemon")
        expect(user2.reload.last_name).to eq("Master")
      end

      it 'redirects to the newly updated user' do
        put :update, id: user2.id, user: { first_name: first_name, last_name: last_name }
        response.should redirect_to User.last
      end
    end
end
