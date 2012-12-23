require 'spec_helper'

describe "Tasks" do
  describe "GET /" do
    it "has form to add a task" do
      new_task = "test task #{rand}"
      visit root_path
      fill_in 'task_name', with: new_task
      expect { click_button 'Create Task' }.to change(Task, :count).by(1)

      response.should have_selector(
        '.task_property', content: new_task
      )
    end
  end
end
