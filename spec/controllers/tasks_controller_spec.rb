require 'spec_helper'

describe TasksController do
  # これは消してhtmlのテストはviewに置くべき
  render_views

  describe "GET 'list'" do
    before :each do
      get :list
    end
    it "returns http success" do
      response.should be_success
    end

    it 'has task list' do
      #そもそもテーブルでないといけない理由はないけど...
      response.should have_selector('table#task_list')
      # タスクが0この場合も考えてとりあえずthのみテスト
      response.should have_selector('th.task_header')
    end

    it 'has a form to post a new task' do
      response.should have_selector('form', method: 'post', action: '/tasks')
      # 現状最低限テストしたいのはタスクの名前
      # 期限はいろいろな入力フォームがありえるので保留
      response.should have_selector('input', name: 'task[name]')
    end
  end

  # 実質Modelのテストになってる... orz
  describe "POST '/tasks/'" do
    context 'in posting valid parameters,' do
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
