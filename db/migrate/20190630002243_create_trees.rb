class CreateTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :trees do |t|
      t.string :register
      t.string :popular_name
      t.string :scientific_name
      t.string :origin
      t.string :extra_info
      t.integer :near_age
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
