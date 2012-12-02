require 'spec_helper'

describe TasksController do
  render_views

  describe "GET 'list'" do
    before :each do
      get 'list'
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
      # 現状最低限テストしたいのはタスクの名前と期限だけど期限はどうテストしようか
      response.should have_selector('input', name: 'task[name]')
    end
  end

  describe "GET 'timer'" do
    it "returns http success" do
      get 'timer'
      response.should be_success
    end
  end

end
