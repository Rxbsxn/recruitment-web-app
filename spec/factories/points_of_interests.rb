FactoryGirl.define do
  factory :points_of_interest do
    user_id { create(:user) }
    points { Faker::Number.number(2) }
    name { Faker::Team.creature }
    type_of_interest { PointsOfInterest::TYPES.sample }
  end
end
