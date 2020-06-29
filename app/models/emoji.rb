class Emoji < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :memos, dependent: :destroy
end
