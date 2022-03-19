class TodoSerializer
  include JSONAPI::Serializer
  attributes :task, :task_completed
end
