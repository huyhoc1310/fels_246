class Category < ApplicationRecord
  has_many :words
  has_many :notifications, as: :notifiable

  validates :name, presence: true,
    length: {maximum: Settings.model.categories.name.maximum}
  validates :description, presence: true,
    length: {maximum: Settings.model.categories.description.maximum}
end
