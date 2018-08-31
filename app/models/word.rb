class Word < ApplicationRecord
  belongs_to :language
  belongs_to :category, optional: true
  has_many :images, as: :imageable
  has_many :answers
  has_many :results
  has_many :lesson_words
  has_many :lessons, through: :lesson_words
end
