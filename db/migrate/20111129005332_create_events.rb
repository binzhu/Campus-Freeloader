class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :eventname
      t.string :desc
      t.string :host
      t.string :building_id
      t.boolean :idcheck
      t.string :user_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
