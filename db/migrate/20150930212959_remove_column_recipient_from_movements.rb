class RemoveColumnRecipientFromMovements < ActiveRecord::Migration
  def change
    remove_column :movements, :recipient
  end
end
