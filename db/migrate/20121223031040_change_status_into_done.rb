class ChangeStatusIntoDone < ActiveRecord::Migration
  def change
    add_column :tasks, :done, :bool
    remove_column :tasks, :status
  end
end
