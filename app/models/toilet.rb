class Toilet < ApplicationRecord

  belongs_to :customer

  validates :name, presence: true, length: { maximum: 15 }
  validates :month, presence: true
  validates :day, presence: true
  validates :day_of_week, presence: true
  validates :time_zone, presence: true
  validates :time_zone, presence: true
  validates :remarks, length: { maximum: 15 }
end
