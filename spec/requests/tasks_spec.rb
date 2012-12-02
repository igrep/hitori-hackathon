require 'spec_helper'

describe "Tasks" do
  describe "GET /" do
    it "has form to add a task" do
      new_task = { name: 'test task' }
      visit root_path
      fill_in 'task_name', with: new_task[:name]
      expect { click_button 'Create Task' }.to change(Task, :count).by(1)
    end
  end
end
