class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :price
      t.integer :num

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
