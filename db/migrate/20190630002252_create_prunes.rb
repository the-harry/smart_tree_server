class CreatePrunes < ActiveRecord::Migration[5.2]
  def change
    create_table :prunes do |t|
      t.string :type
      t.datetime :last_prune
      t.string :notes

      t.timestamps
    end
  end
end
