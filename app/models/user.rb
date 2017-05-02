class User < ApplicationRecord
  has_many :points_of_interests, inverse_of: :user

  accepts_nested_attributes_for :points_of_interests, reject_if: :all_blank, allow_destroy: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def self.default_password(attr = {})
    default = 'secret'
    self.create(attr.merge(password: default,
      password_confirmation: default))
  end
end
