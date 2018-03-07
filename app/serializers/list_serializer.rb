class ListSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :title
  belongs_to :user
  has_many :items

  def created_at
    object.created_at.strftime('%b %e %Y %H:%M%p')
  end
end
