class User < ApplicationRecord
  require "securerandom"
  has_secure_password
  validates :username, presence: true
  validates :password, presence: true

end
