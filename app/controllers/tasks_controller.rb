class TasksController < ApplicationController
  def list
    @headers = Task::PROPERTY_NAMES
    @tasks = Task.all
  end

  def timer
  end
end
