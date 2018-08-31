class Image < ApplicationRecord
  attr_accessor :url
  belongs_to :imageable, polymorphic: true, optional: true
end
