class DropLastPruneFromPrunes < ActiveRecord::Migration[5.2]
  def change
    remove_column :prunes, :last_prune
  end
end
