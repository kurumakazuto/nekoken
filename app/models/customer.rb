class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  attr_accessor :image_check

  has_many :favorites, dependent: :destroy
  has_many :topic_comments, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :calendars, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :toilets, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 }
  validates :cat_name, presence: true, length: { maximum: 10 }
  validates :cat_gender, presence: true
  validates :introduction, length: { maximum: 200 }

  before_validation :check_image

  def check_image
      if !self.image_check
         self.errors.add(:image, "は不適切な画像です")
      end
   end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
     customer.password = SecureRandom.urlsafe_base64
     customer.name = "ゲスト"
     customer.cat_name = "ゲスト"
     customer.cat_gender = "♂"
    end
  end

  def active?
    is_active
  end

end
