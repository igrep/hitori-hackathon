require 'spec_helper'

describe "Tasks" do
  describe "GET /" do
    it "has form to add a task" do
      new_task = 'test task'
      visit root_path
      fill_in 'task_name', with: new_task
      expect { click_button 'Create Task' }.to change(Task, :count).by(1)

      # 他に既にタスクがある場合を想定すると適切じゃない。。。
      response.should have_selector('.task_property', content: new_task )
      response.should have_selector(
        '.task_property', content: Task::STATUS_NOT_YET
      )
    end
  end
end
