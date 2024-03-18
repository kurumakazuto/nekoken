class Calendar < ApplicationRecord

  belongs_to :customer

  validates :title, presence: true
  validates :content, length: { maximum: 100 }
  validates :start_time, presence: true
end
