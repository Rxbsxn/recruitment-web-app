require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  describe '#index' do
    let(:user) { create(:user) }
    context 'User non-logged' do
      it 'returns to login' do
        get :index
        expect(response).to redirect_to(new_user_session_path)  
      end
    end
    context 'regular user' do
      before { sign_in user }
      it 'returns to index' do
        get :index
        expect(response).to redirect_to(root_path)       
      end
    end
  end
end
