class ItemSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description
  belongs_to :list
end
