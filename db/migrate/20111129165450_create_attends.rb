class CreateAttends < ActiveRecord::Migration
  def self.up
    create_table :attends do |t|
      t.string :user_id
      t.string :event_id
      t.date :attend

      t.timestamps
    end
  end

  def self.down
    drop_table :attends
  end
end
