class Food < ApplicationRecord
  
  has_many :events, dependent: :destroy
  belongs_to :customer
end
