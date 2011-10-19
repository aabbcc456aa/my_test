class CreateWarnMessages < ActiveRecord::Migration
  def self.up
    create_table :warn_messages do |t|
       t.string :diagnosis
       t.string :equipmentNo
       t.string :faultDesc
       t.string :faultLevel
       t.string :orgin_id
       t.string :occurTime

      t.timestamps
    end
  end

  def self.down
    drop_table :warn_messages
  end
end
