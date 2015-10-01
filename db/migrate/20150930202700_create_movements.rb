class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.decimal :amount
      t.integer :recipient
      t.string :description

      t.timestamps null: false
    end
  end
end
