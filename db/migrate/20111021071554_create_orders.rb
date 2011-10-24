class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :all_total
      t.string :order_perosn
      t.date :order_date
      t.integer :order_all_num

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
