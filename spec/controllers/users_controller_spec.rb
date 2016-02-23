require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user2){User.create(first_name: "Hello", last_name: "Kitty", email: "hellokitty1@gmail.com", password: "12345678")}
  let(:user3) { User.create(first_name: "Taylor", last_name: "Swift", email: "taytay@gmail.com", password: "12345678") }
	  
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

	  describe 'DELETE #destroy' do

	    it 'decrements users by one' do
	    	user_id = user3.id
	    	p user3
	    	p user_id
	    	p User.last
	      put :destroy, id: user_id
	      expect(User.last).not_to be(user3)
	    end

	    it 'redirects to the root path' do
	      user_id = user3.id
	      delete :destroy, id: user_id
	      expect(response.status).to eq(302)
	    end
	  end


end
