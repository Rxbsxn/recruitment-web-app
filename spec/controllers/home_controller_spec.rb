require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }
  describe "#index" do
    it 'no session it redirect to sign in' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    context 'user exist and logged' do
      before {sign_in user} 
      it 'redirect to index path' do
        get :index
        expect(response).to be_success  
      end
    end
    
    context 'User sign in' do
      before {sign_in user} 
      
      it 'return current user' do
        expect(controller.current_user).to eq(user)
      end
    end

    context 'User sign out' do
      before {sign_out user}
      
      it 'return nil in current user' do
        expect(controller.current_user).to be_nil        
      end
    end
  end
end
