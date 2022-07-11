class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :username
  has_many :todos
end