class Task < ActiveRecord::Base
  attr_accessible :due_time, :name, :status
end
