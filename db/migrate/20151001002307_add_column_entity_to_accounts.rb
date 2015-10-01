class AddColumnEntityToAccounts < ActiveRecord::Migration
  def change
    add_reference :accounts, :entity, foreign_key: true
  end
end
