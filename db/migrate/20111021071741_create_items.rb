class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :item_no
      t.string :item_price
      t.integer :item_num
      t.integer :item_total_price
      t.date :item_date
      t.string :item_person

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
