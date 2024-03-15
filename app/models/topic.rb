class Topic < ApplicationRecord

   has_many :favorites, dependent: :destroy
   has_many :topic_comments, dependent: :destroy
   belongs_to :customer

   has_one_attached :image

   validates :title, presence: true
   validates :introduction, presence: true
   validates :category, length: { maximum: 8 }

  def favorited_by?(customer)
      favorites.exists?(customer_id: customer.id)
  end

 def self.looks(search, word)
   if search == "perfect_match"
     @topics_title = Topic.where("title LIKE?", "#{word}")
   elsif search == "forward_match"
     @topics_title = Topic.where("title LIKE?", "#{word}%")
   elsif search == "backward_match"
     @topics_title = Topic.where("title LIKE?", "%#{word}")
   elsif search == "partial_match"
     @topics_title = Topic.where("title LIKE?", "%#{word}%")
   else
     @topics_title = Topic.all
   end
 end

 def self.looks(search, word)
   if search == "perfect_match"
     @topics_introduction = Topic.where("introduction LIKE?", "#{word}")
   elsif search == "forward_match"
     @topics_introduction = Topic.where("introduction LIKE?", "#{word}%")
   elsif search == "backward_match"
     @topics_introduction = Topic.where("introduction LIKE?", "%#{word}")
   elsif search == "partial_match"
     @topics_introduction = Topic.where("introduction LIKE?", "%#{word}%")
   else
     @topics_introduction = Topic.all
   end
 end

end
