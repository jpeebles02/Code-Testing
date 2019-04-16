require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "#toggle_complete!" do
    it "should switch complete to false if it was true" do
      task = Task.create(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it "should switch complete to true if it was false" do
      task = Task.create(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe "#toggle_favorite!" do
    it "should switch favorite to true it it was false" do
      task = Task.create(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end
  end

  describe "#overdue?" do
    it "should tell if task is past the deadline" do
      task = Task.create(deadline: Time.now + 10.days)
      expect(task.overdue?).to eq(false)
    end
  end

  describe "#increment_priority!" do
    it "should add 1 value to priority" do
      task = Task.create(priority: 1)
      task.increment_priority!
      expect(task.priority).to eq(2)
    end
  end

  describe "#decrement_priority!" do
    it "should subtract 1 value to priority" do
      task = Task.create(priority: 2)
      task.decrement_priority!
      expect(task.priority).to eq(1)
    end
  end

  describe "#snooze_hour!" do
    it "should add hour to deadline" do
      the_deadline = Time.now
      task = Task.create(deadline: the_deadline)
      task.snooze_hour!
      expect(task.deadline).to eq(the_deadline + 1.hour)
    end
  end
end