class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :email
  has_many :lists
end
