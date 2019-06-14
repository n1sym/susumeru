class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notified_by, class_name: 'User'
  belongs_to :relationship, optional: true
  belongs_to :like, optional: true
  belongs_to :micropost, optional: true
  default_scope -> { order(created_at: :desc) }
  
end
