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
end
