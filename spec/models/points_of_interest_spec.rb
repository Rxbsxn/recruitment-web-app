require 'rails_helper'

RSpec.describe PointsOfInterest, type: :model do
  describe 'Points of Interest count' do
    it 'has none inside' do
      expect(PointsOfInterest.count).to eq 0
    end
    it 'one point of interest in database' do
      create(:points_of_interest)
      expect(PointsOfInterest.count).to eq 1
    end
    it 'hundred Points of interest in database' do
      100.times { create(:points_of_interest) }
      expect(PointsOfInterest.count).to eq 100
    end
  end
  
  describe 'Point of interest is valid' do
    let(:poi) { create(:points_of_interest) }
    it 'return passed validation' do
      expect(poi).to be_valid
    end
  end


  describe "Points of interest's attribs" do
    let(:poi) { create(:points_of_interest) }
    it 'returns point of interest name' do
      expect(poi.name).to match(poi.name)
    end

    it 'returns point of interest type' do
      expect(poi.type_of_interest).to match(poi.type_of_interest)
    end

    it 'returns point of interest points count' do
      expect(poi.points).to match(poi.points)
    end
  end
end
