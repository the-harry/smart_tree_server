class RenamePruneType < ActiveRecord::Migration[5.2]
  def change
    rename_column :prunes, :type, :prune_type
  end
end
