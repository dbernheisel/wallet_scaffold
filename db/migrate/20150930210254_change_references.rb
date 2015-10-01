class ChangeReferences < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.references :movements
    end
    change_table :entities do |t|
      t.references :accounts
    end
    change_table :movements do |t|
      t.references :account
    end
  end
end
