require 'spec_helper'

describe Task do
  context 'when adding a task,' do

    subject { Task.add_unfinished( name: 'Test Task', due_time: Time.now ) }

    # Task.countの増減をテストするにはこの場合どうすればよいものか。
    # とりあえずcontrollerのテストでやってるからいいか。
    it 'adds the new task to the last' do
      should be_valid
      should == Task.last
    end

    it "can't add a task whose name is blank" do
      subject.name = ''
      should_not be_valid
    end

    it "adds a task which is not done" do
      subject.should_not be_done
    end

    it 'adds a task with its description' do
      should be_respond_to( :description )
    end

    it 'adds a task whose description can be assigned' do
      subject.description = 'This is a task for testing'
      should be_valid
    end
  end

  context 'when adding by add_from_kvs' do
    before { Task.delete_all }

    before :all do
      @kvs_tasks = {
        test1: { description: 'a', done: true, due_time: Time.now },
        test2: { description: 'b', done: false },
        test3: { description: 'c' },
        test4: {},
      }.stringify_keys
      @bad_kvs_tasks = { '' => {} }

      @tasks = @kvs_tasks.map do|k,v|
        Task.new( v.merge( name: k ) )
      end
    end

    it 'can add multiple tasks with valid properties' do
      returned = Task.add_from_kvs @kvs_tasks

      Task.all.should eq @tasks
    end
  end
end
