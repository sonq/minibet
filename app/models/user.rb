class User < ActiveRecord::Base
  has_many :bets, dependent: :delete_all
  validates :username, presence: true, uniqueness: true
  has_secure_password
end