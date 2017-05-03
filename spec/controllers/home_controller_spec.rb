require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }
  let(:call_request) { delete :destroy, params: { id: user.id } }
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

  describe '#destroy' do
    context 'regular user' do
      before { sign_in user }
      
      it 'return permission denied' do
        expect { call_request }.to raise_error
      end 
    end

    context 'user is an admin' do
      let(:admin) { create(:admin) } 
      before { sign_in admin }
      
      it 'admin have rights it no raise error' do
        expect { call_request }.to_not raise_error
      end 
    end

    context 'admin delete himself' do
      let(:admin) { create(:admin) }
      let(:bad_request) { delete :destroy, params: { id: admin.id } }
      before { sign_in admin }

      it 'raise error' do
        expect { bad_request }.to raise_error  
      end 
    end
  end
end
