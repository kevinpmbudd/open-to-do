class ListSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :title
  belongs_to :user
  has_many :items
end
