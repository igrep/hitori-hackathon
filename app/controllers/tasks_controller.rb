class TasksController < ApplicationController

  def index
    @new_task = Task.new
    @headers = Task::PROPERTY_NAMES
    @tasks = Task.all
  end

  skip_before_filter(
    :avoid_change,
    only: [:index, :timer, :show]
  )

  def add
    Task.add_unfinished params[:task]
    redirect_to action: 'index'
  end

  def show
    @task = Task.find_by_id( params[:id].to_s )
  end

  def timer
  end
end
