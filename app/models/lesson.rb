class Lesson < ApplicationRecord
  has_many :lesson_words
  has_many :words, through: :lesson_words
  has_many :user_lessons
  has_many :users, through: :user_lessons
end
