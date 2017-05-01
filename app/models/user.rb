class User < ApplicationRecord
  has_many :points_of_interests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def self.default_password(attr: nil)
    default = 'secret'
    self.create(attr.merge(password: default, password_confirmation: default))
  end
end
