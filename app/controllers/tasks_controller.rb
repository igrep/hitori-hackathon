class TasksController < ApplicationController
  def list
    @new_task = Task.new
    @headers = Task::PROPERTY_NAMES
    @tasks = Task.all
  end

  def timer
  end
end
