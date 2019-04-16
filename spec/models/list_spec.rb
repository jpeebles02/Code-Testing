require "rails_helper"

RSpec.describe List, type: :model do
  describe "#complete_all_tasks!" do
    it "should mark all tasks in the list as complete" do
      list = List.create(name: "Chores")
      task1 = Task.create(list_id: list.id, complete: false)
      task2 = Task.create(list_id: list.id, complete: false)
      list.complete_all_tasks!

      expect(list.tasks[0].complete).to eq(true)
      expect(list.tasks[1].complete).to eq(true)
      # or write a loop
      # list.tasks.each do |task|
      #   expect(task.complete).to eq(true)
      # end
    end
  end

  describe "#total_duration" do
    it "should sum up all task durations" do
      list = List.create(name: "Dishes")
      task1 = Task.create(list_id: list.id, duration: 1)
      task1 = Task.create(list_id: list.id, duration: 2)
      expect(list.total_duration).to eq(3)
    end
  end

end
