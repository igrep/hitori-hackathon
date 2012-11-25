class Task < ActiveRecord::Base
  attr_accessible :due_time, :name, :status
  validates :name, :presence => true
  #validates :status, :inclusion => ['not yet', 'doing', 'done']

  DEFAULT_STATUS = 'not yet'

  PROPERTY_NAMES = {
    name: 'Task',
    due_time: 'Deadline',
    status: 'Status'
  }
end
