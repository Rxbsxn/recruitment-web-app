FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'topsecret' }
    password_confirmation { password }
  
    factory :admin do
      after(:create) { |user| user.update_attribute(:admin, true) }
    end
  end
end
