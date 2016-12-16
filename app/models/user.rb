class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :attends
  has_many :events_attend, through: :attends, source: :event
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :city, :state, presence: true
  validates :email, uniqueness: {case_sensitive: false}, format: { with: email_regex }
  validates :password, presence:true, confirmation: true, on: :create
end
