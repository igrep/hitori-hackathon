require 'spec_helper'

describe TasksController do
  # これは消してhtmlのテストはviewに置くべき
  render_views

  describe "GET 'index'" do
    before :each do
      get :index
    end
    it "returns http success" do
      response.should be_success
    end

    context 'after adding a task' do
      before :all do
        Task.add_unfinished name: "test", due_time: Time.now
      end
      it 'has task list' do
        #そもそもテーブルでないといけない理由はないけど...
        response.should have_selector('table#task_list') do|table|
          table.should have_selector('th.task_header')
          table.should have_selector('a') do|anchors|
            a = anchors.first
            a['href'].should =~ %r'tasks/.+'
            a['id'].should =~ /^link_to_task_/
          end
        end
      end
    end

    it 'has a form to post a new task' do
      response.should have_selector('form', method: 'post', action: '/tasks') do|f|
        # 現状最低限テストしたいのはタスクの名前
        # 期限はいろいろな入力フォームがありえるので保留
        f.should have_selector('input', name: 'task[name]')
        f.should have_selector('textarea', name: 'task[description]' )
      end
    end
  end

  # 実質Modelのテストになってる... orz
  describe "POST '/tasks/'" do
    context 'in posting valid parameters,' do
      context 'when FILE_UPDATE_OK does not exist,' do

        before :all do
          FileUtils.rm ApplicationController::FILE_UPDATE_OK, force: true
        end

        after :all do
          FileUtils.touch ApplicationController::FILE_UPDATE_OK
        end

        it 'doesn\'t increase the number of tasks' do
          expect {
            post :add, task: { name: 'test', due_time: Time.now }
          }.not_to change(Task, :count).by(1)
        end

      end

      context 'when FILE_UPDATE_OK exists,' do

        before :all do
          FileUtils.touch ApplicationController::FILE_UPDATE_OK
        end

        after :all do
          FileUtils.rm ApplicationController::FILE_UPDATE_OK, force: true
        end

        it 'increases the number of tasks' do
          expect {
            post :add, task: { name: 'test', due_time: Time.now }
          }.to change(Task, :count).by(1)
        end

        it 'increases the number of tasks without due_time' do
          expect {
            post :add, task: { name: 'test' }
          }.to change(Task, :count).by(1)
        end

      end

    end

    it 'in posting invalid parameters, doesn\'t increase the number of tasks' do
      expect {
        post :add, task: { name: '', due_time: Time.now }
      }.not_to change(Task, :count).by(1)
    end
  end

  describe "GET 'timer'" do
    it "returns http success" do
      get 'timer'
      response.should be_success
    end
  end

end
