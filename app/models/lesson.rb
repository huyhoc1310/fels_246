class Lesson < ApplicationRecord
  has_many :lesson_words, dependent: :destroy
  accepts_nested_attributes_for :lesson_words
  has_many :words, through: :lesson_words
  has_many :user_lessons
  has_many :users, through: :user_lessons

  scope :load_lessons, ->{select(:id, :name).order :name}
end
