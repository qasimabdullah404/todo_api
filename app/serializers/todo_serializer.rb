class TodoSerializer
  include JSONAPI::Serializer
  attributes :task, :task_completed
  belongs_to :user
end
