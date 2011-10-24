class ItemsOrders < ActiveRecord::Migration
  def self.up
    create_table :items_orders, :id => false do |t|
        t.integer :item_id
        t.integer :order_id
      end

  end

  def self.down
  end
end
