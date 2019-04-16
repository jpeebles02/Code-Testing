require "rails_helper"

RSpec.describe List, type: :model do

  describe "#complete_all_tasks!" do
    it "should mark all tasks in the list as complete" do
      list = List.create(name: "Chores")
      task1 = Task.create(list_id: list.id, complete: false)
      task2 = Task.create(list_id: list.id, complete: false)
      list.complete_all_tasks!

      # expect(list.tasks[0].complete).to eq(true)
      # expect(list.tasks[1].complete).to eq(true)
      # or write a loop
      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end
    end
  end


  describe "#snooze_all_tasks!" do
    it "should increase each task deadline by 1 hour" do
      list = List.create(name: "Dishes")
      Task.create(list_id: list.id, deadline: Time.new(2019, 1, 1))
      Task.create(list_id: list.id, deadline: Time.new(2019, 1, 1))
      Task.create(list_id: list.id, deadline: Time.new(2019, 1, 1))
      list.snooze_all_tasks!

      list.tasks.each do |task|
        expect(task.deadline).to eq(Time.new(2019, 1, 1) + 1.hour)
      end
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

  describe "#incomplete_tasks" do
    it "should return an array of all incomplete tasks" do
      list = List.create(name: "Mow Lawn")
      task1 = Task.create(list_id: list.id, complete: true)
      task2 = Task.create(list_id: list.id, complete: false)
      task3 = Task.create(list_id: list.id, complete: true)
      task4 = Task.create(list_id: list.id, complete: false)
      array_of_tasks = list.incomplete_tasks
      expect(array_of_tasks).to eq([task2,task4])

      array_of_tasks.each do |task|
        expect(task.complete).to eq(false)
      end
    end
  end

  describe "#favorite_tasks" do
    it "should return an array of all favorite tasks" do
      list = List.create(name: "Mow Lawn")
      task1 = Task.create(list_id: list.id, favorite: true)
      task2 = Task.create(list_id: list.id, favorite: false)
      task3 = Task.create(list_id: list.id, favorite: true)
      task4 = Task.create(list_id: list.id, favorite: false)
      array_of_tasks = list.favorite_tasks
      expect(array_of_tasks).to eq([task1,task3])
    end
  end

end
