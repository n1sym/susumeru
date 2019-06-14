class Like < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  has_many :notifications, dependent: :destroy
  validates :user_id, {presence: true}
  validates :micropost_id, {presence: true}
end
