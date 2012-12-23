require 'spec_helper'

describe Task do

  context 'when adding a task' do
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
  end

  context "when changing a task's status" do
    before :all do
      @ids = [
        Task.add_unfinished( name: 'Test Task1', due_time: Time.now ),
        Task.add_unfinished( name: 'Test Task2', due_time: Time.now ),
      ].map(&:id)
    end
    it "can change several tasks' status " do
      Task.change_done true, *@ids
      @ids.each do|id|
        Task.find( id ).should be_done
      end
    end
  end
end
