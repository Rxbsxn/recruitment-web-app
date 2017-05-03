class User < ApplicationRecord
  SQL_QUERY = "SELECT COUNT(*) FROM users
      JOIN points_of_interests ON user_id = users.id
      WHERE (gender = 'woman') AND (age BETWEEN 20 AND 30)
      AND (type_of_interest = 'health') AND (name LIKE 'cosm%')".freeze

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
