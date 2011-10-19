class CreateAas < ActiveRecord::Migration
  def self.up
    create_table :aas do |t|
      t.string :aa

      t.timestamps
    end
  end

  def self.down
    drop_table :aas
  end
end
