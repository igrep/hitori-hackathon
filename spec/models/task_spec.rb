require 'spec_helper'

describe Task do
  describe 'when adding a task' do
    before :each do
      @added_task = Task.add( name: 'Test Task', due_time: Time.now )
    end

    it 'the task is added to the last ' do
      @added_task.should be_valid
      Task.last.should == @added_task
    end

    it "the task name cannot be blank" do
      @added_task.name = ''
      @added_task.should_not be_valid
    end

    it "the added task's status is Task::STATUS_NOT_YET" do
      @added_task.status.should == Task::STATUS_NOT_YET
    end
  end
end
