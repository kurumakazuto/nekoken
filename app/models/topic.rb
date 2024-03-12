class Topic < ApplicationRecord
  
   has_many :favorites, dependent: :destroy
   has_many :topic_comments, dependent: :destroy
   belongs_to :customer
   
   has_one_attached :image
end
