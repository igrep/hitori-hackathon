class TasksController < ApplicationController

  def list
    @new_task = Task.new
    @headers = Task::PROPERTY_NAMES
    @tasks = Task.all
  end

  def add
    Task.add(params[:task])
    redirect_to( action: 'list' )
  end

  def timer
  end
end
