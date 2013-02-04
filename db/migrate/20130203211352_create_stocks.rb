class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.string :name, :null => false
      t.decimal :price, :precision => 7, :scale => 2
      t.integer :quantity
      t.decimal :percent, :precision => 7, :scale => 2
      t.integer :years
      t.decimal :value, :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :stocks
  end
end
