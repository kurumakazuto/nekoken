class TopicComment < ApplicationRecord

  belongs_to :customer
  belongs_to :topic
end
