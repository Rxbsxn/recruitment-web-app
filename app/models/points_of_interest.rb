class PointsOfInterest < ApplicationRecord
  TYPES = ['health', 'hobby', 'work'].freeze
  
  belongs_to :user

  validates :type , inclusion: { in: TYPES }
  validates :points, numericality: { only_integer: true }
end
