class User < ApplicationRecord
  SQL_QUERY = "SELECT
              (SELECT COUNT(points) FROM points_of_interests WHERE user_id = users.id AND (type_of_interest = 'health') AND (name LIKE 'cosm%')) 
              FROM users 
              WHERE (gender = 'woman') AND (age BETWEEN 20 AND 30)".freeze

  has_many :points_of_interests, inverse_of: :user

  accepts_nested_attributes_for :points_of_interests, reject_if: :all_blank, allow_destroy: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  def self.default_password(attr = {})
    default = 'secret'
    self.create(attr.merge(password: default,
      password_confirmation: default))
  end
  
  def self.to_csv
    attributes = %w(id email admin gender age)
    
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << user.attributes.values_at(*attributes)
      end
    end
  end
end
