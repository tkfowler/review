class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :content, :user_id, :event_id, presence: true
end
