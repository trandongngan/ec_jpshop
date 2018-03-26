class User < ApplicationRecord
  extend Enumerize

  enumerize :role, in: {user: 1, seller: 2, admin: 0}, default: :user

  has_secure_password

  validates :username, presence: true
  validates :email, presence: true, email_format: true

end
