class Food < ApplicationRecord

  belongs_to :customer

  validates :name, presence: true, length: { maximum: 15 }
  validates :amount, presence: true, length: { maximum: 5 }, numericality: { only_integer: true }
  validates :month, presence: true
  validates :day, presence: true
  validates :day_of_week, presence: true
  validates :time_zone, presence: true
  validates :time_zone, presence: true
  validates :remarks, length: { maximum: 15 }

end
