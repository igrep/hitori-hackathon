class Task < ActiveRecord::Base
  attr_accessible :due_time, :name, :status

  STATUS_NOT_YET = 'not yet'.freeze
  STATUS_DOING = 'doing'.freeze
  STATUS_DONE = 'done'.freeze

  PROPERTY_NAMES = {
    name: 'Task',
    due_time: 'Deadline',
    status: 'Status'
  }

  def self.add params
    self.create params.merge( status: STATUS_NOT_YET )
  end
end
