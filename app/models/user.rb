class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true, email_format: true

end
