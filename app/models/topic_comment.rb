class TopicComment < ApplicationRecord

  belongs_to :customer
  belongs_to :topic

  validates :comment, presence: true, length: { maximum: 100 }
end
