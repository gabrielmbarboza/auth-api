class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false
end
