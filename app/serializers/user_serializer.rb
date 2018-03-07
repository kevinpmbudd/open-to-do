class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :email
  has_many :lists

  def created_at
    object.created_at.strftime('%b %e %Y %H:%M%p')
  end
end
