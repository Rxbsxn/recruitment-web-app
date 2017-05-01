class AddTypeToPointsOfInterests < ActiveRecord::Migration[5.0]
  def change
    add_column :points_of_interests, :type, :string
  end
end
