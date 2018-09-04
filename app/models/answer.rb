class Answer < ApplicationRecord
  belongs_to :word
  has_one :result
end
