class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :accounts, :movement
  end
end
