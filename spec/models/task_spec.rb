require 'spec_helper'

describe Task, 'when adding a task' do

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
