class AddColumnToMovements < ActiveRecord::Migration
  def change
    add_column :movements, :other_party, :string
  end
end
