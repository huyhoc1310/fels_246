class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :results
  accepts_nested_attributes_for :results
end
