class Article < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  acts_as_taggable
end
