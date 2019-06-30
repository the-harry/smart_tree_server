class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :host
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
