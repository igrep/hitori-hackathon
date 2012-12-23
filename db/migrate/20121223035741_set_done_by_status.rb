class SetDoneByStatus < ActiveRecord::Migration
  def up
    Task.update_all(
      'done = 1',
      ['status = ?', Task::STATUS_DONE]
    )
  end

  def down
    Task.update_all('done = 0')
  end
end
