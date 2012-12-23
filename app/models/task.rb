class Task < ActiveRecord::Base
  attr_accessible :due_time, :name, :done
  validates :name, presence: true

  PROPERTY_NAMES = {
    name: 'Task',
    due_time: 'Deadline',
    done: 'Status'
  }

  def self.add_unfinished params
    self.create params.merge( done: false )
  end
end
