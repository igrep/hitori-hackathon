class TasksController < ApplicationController

  def list
    @new_task = Task.new
    @headers = Task::PROPERTY_NAMES
    @tasks = Task.all
  end

  def add
    Task.add_unfinished(params[:task])
    redirect_to( action: 'list' )
  end

  def timer
  end
end
