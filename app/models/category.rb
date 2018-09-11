class Category < ApplicationRecord
  has_many :words
  has_many :notifications, as: :notifiable

  validates :name, presence: true,
    length: {maximum: Settings.model.categories.name.maximum}
  validates :description, presence: true,
    length: {maximum: Settings.model.categories.description.maximum}

  scope :load_categories, ->{select(:id, :name).order :name}
end
