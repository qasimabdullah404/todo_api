class Todo < ApplicationRecord
  validates_presence_of :task, message: "can't be blank"
  validates_length_of :task, within: 5..140, message: "must be between 5 and 140 characters."
end
