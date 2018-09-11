class Image < ApplicationRecord
  attr_accessor :image
  belongs_to :imageable, polymorphic: true, optional: true
  mount_uploader :image, ImageUploader

  scope :find_words_image, ->(word_id){where imageable_id: word_id}
end
