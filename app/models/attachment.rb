class Attachment < ActiveRecord::Base
  mount_uploader :picture, ImageUploader
  belongs_to :article
  validates :picture, presence: true
end
