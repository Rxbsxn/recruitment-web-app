class AddTypeToPointsOfInterests < ActiveRecord::Migration[5.0]
  def change
    add_column :points_of_interests, :type_of_interest, :string
  end
end
