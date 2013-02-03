class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.float :percent
      t.integer :years
      t.float :value

      t.timestamps
    end
  end
end
