FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'topsecret' }
    password_confirmation { password }
  end
end
