class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 300 }

  
  scope :search_by_keyword, -> (keyword) {
    where("microposts.content LIKE :keyword or microposts.genre3 LIKE :keyword
    or microposts.title LIKE :keyword
     or microposts.genre LIKE :keyword
      or microposts.genre2 LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}%") if keyword.present?
  }
end
