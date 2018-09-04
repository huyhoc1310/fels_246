class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :validatable
  has_many :active_relationships, class_name: Relationship.name,
           foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
           foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_one :image, as: :imageable, dependent: :destroy
  has_many :notifications, as: :notifiable
  has_many :activities
  has_many :user_lessons
  has_many :lessons, through: :user_lessons
end
