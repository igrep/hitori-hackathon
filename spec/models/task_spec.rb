require 'spec_helper'

describe Task do
  it 'can add a non-blank task' do
    added_task = Task.add( name: 'Test Task', due_time: Time.now )
    added_task.should be_valid
  end

  it 'can not add blank task' do
    added_task = Task.add( name: '', due_time: Time.now )
    added_task.should_not be_valid
  end

  it 'adds a task whose initial status is Task::STATUS_NOT_YET' do
    added_task = Task.add( name: 'Test Task', due_time: Time.now )
    added_task.status.should == Task::STATUS_NOT_YET
  end
end
