class AddTreeIdToPrune < ActiveRecord::Migration[5.2]
  def change
    add_column :prunes, :tree_id, :integer
  end
end
