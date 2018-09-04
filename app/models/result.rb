class Result < ApplicationRecord
  belongs_to :user_lesson
  belongs_to :word
  belongs_to :answer
end
