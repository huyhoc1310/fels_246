class LessonWord < ApplicationRecord
  belongs_to :lesson
  belongs_to :word
end
