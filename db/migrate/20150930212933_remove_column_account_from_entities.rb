class RemoveColumnAccountFromEntities < ActiveRecord::Migration
  def change
    remove_column :entities, :account
  end
end
