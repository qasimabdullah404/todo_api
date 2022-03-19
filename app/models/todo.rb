class Todo < ApplicationRecord
  validates_presence_of :task, on: :create, message: "Task can't be blank"
end
