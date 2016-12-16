class Event < ApplicationRecord
  belongs_to :user
  has_many :attends
  has_many :comments, dependent: :destroy
  has_many :users_attend, through: :attends, source: :user
  validates :name, :date, :city, :state, presence: true
end
