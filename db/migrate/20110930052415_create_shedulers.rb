class CreateShedulers < ActiveRecord::Migration
  def self.up
    create_table :shedulers do |t|
      t.string :name
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :shedulers
  end
end
