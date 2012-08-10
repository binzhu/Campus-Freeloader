class ChangeDatetypeForTables < ActiveRecord::Migration
  def up
    change_table :events do |t|
      t.change :building_id, :integer
      t.change :user_id, :integer
    end
    change_table :users do |t|
      t.change :building_id, :integer
    end      
  end

  def down
    change_table :events do |t|
      t.change :building_id, :string
      t.change :user_id, :string
    end
    change_table :users do |t|
      t.change :building_id, :string
    end       
  end
end
