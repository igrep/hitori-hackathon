class ChangeTimeToDatetime < ActiveRecord::Migration
  def up
    change_column :tasks, :due_time, :datetime
  end

  def down
    change_column :tasks, :due_time, :time
  end
end
