class ChangeDatatypeForAttends < ActiveRecord::Migration
  def up
  change_table :attends do |t|
      t.change :event_id, :integer
      t.change :user_id, :integer
    end    
  end

  def down
    change_table :attends do |t|
      t.change :event_id, :string
      t.change :user_id, :string
    end    
  end
end
