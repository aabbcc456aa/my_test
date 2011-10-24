class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      t.integer :item_id
      t.decimal :item_num
      t.decimal :item_total_price
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :carts
  end
end
