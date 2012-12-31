require 'spec_helper'

describe "Tasks" do

  describe "GET /" do
    describe 'the form to add a task' do
      before do
        @new_task = "test task #{rand}"
        visit root_path
        fill_in 'task_name', with: @new_task
      end

      context 'when FILE_UPDATE_OK exists,' do
        before :all do
          FileUtils.touch ApplicationController::FILE_UPDATE_OK
        end

        it "can add a task from the form" do
          expect { click_button 'Create Task' }.to change(Task, :count).by(1)

          response.should have_selector(
            '.task_property', content: @new_task
          )
        end

        after :all do
          FileUtils.rm ApplicationController::FILE_UPDATE_OK, force: true
        end
      end

      context 'when FILE_UPDATE_OK does not exist,' do
        before :all do
          FileUtils.rm ApplicationController::FILE_UPDATE_OK, force: true
        end

        after :all do
          FileUtils.touch ApplicationController::FILE_UPDATE_OK
        end

        it "can't add a task from the form" do
          expect { click_button 'Create Task' }.not_to change(Task, :count).by(1)

          #follow_redirect!
          response.should have_selector '.error'
          # back to the previous page.
          response.should have_selector 'a', href: root_path
        end

      end
    end
  end
end
