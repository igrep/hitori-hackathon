class Task < ActiveRecord::Base
  attr_accessible(
    :due_time,
    :name,
    :done,
    :description
  )
  validates :name, presence: true

  PROPERTY_NAMES = {
    name: 'Task',
    due_time: 'Deadline',
    done: 'Done?'
  }

  def done?
    self.done
  end

  def self.add_unfinished params
    self.create params.merge( done: false )
  end

  def self.change_done new_done, *ids
    as_i = if new_done then 1 else 0 end
    Task.update_all(
      ['done = ?', as_i],
      id: ids
    )
  end
end
