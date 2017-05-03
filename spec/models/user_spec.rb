require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Users count' do
    it 'has none user inside' do
      expect(User.count).to eq 0
    end
    it 'one user in database' do
      create(:user)
      expect(User.count).to eq 1
    end
    it 'hundred users in database' do
      100.times { create(:user) }
      expect(User.count).to eq 100
    end
  end
  
  describe 'User is valid' do
    let(:user) { create(:user) }
    it 'if valid should return true' do
      expect(user).to be_valid
    end
  end

  describe "User's attribs" do
    let(:user) { create(:user) }
    it 'returns user email' do
      expect(user.email).to match(user.email)
    end
  end
end
