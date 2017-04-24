class CreatePointsOfInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :points_of_interests do |t|
      t.references :user, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
