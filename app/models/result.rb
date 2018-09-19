class Result < ApplicationRecord
  belongs_to :user_lesson, optional: true
  belongs_to :lesson, optional: true
  belongs_to :word
  belongs_to :answer
end
