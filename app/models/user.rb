class User < ApplicationRecord
  has_many :points_of_interests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
