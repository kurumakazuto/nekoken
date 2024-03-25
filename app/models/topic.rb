class Topic < ApplicationRecord

   has_many :favorites, dependent: :destroy
   has_many :topic_comments, dependent: :destroy
   belongs_to :customer

   has_one_attached :image

   validates :title, length: { maximum: 20 }
   validates :introduction, presence: true
   validates :category, length: { maximum: 8 }


  def favorited_by?(customer)
     return false if customer.nil?
     favorites.exists?(customer_id: customer.id)
  end

 def self.looks(search, word, type)
   if search == "perfect_match"
     Topic.where("#{type} LIKE?", "#{word}")
   elsif search == "forward_match"
     Topic.where("#{type} LIKE?", "#{word}%")
   elsif search == "backward_match"
     Topic.where("#{type} LIKE?", "%#{word}")
   elsif search == "partial_match"
     Topic.where("#{type} LIKE?", "%#{word}%")
   end
 end
end
