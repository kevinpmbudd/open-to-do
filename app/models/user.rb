class User < ApplicationRecord
  has_secure_password

  has_many :lists, dependent: :destroy

  validates :name,
            length: { minimum: 3 },
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :email,
            length: { minimum: 3, maximum: 254 },
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :password,
            length: { minimum: 8 },
            presence: true

end
