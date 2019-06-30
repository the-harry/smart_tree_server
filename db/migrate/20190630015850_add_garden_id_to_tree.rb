class AddGardenIdToTree < ActiveRecord::Migration[5.2]
  def change
    add_column :trees, :garden_id, :integer
  end
end
