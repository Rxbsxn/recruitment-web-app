class PointsOfInterest < ApplicationRecord
  TYPES = ['health', 'hobby', 'work'].freeze
  
  belongs_to :user, inverse_of: :points_of_interests

  validates :type_of_interest , inclusion: { in: TYPES },
    allow_blank: true
  validates :points, numericality: { only_integer: true },
    allow_blank: true
end
