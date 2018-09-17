class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :validatable, :omniauthable,
    omniauth_providers: [:facebook, :google_oauth2]
  has_and_belongs_to_many :oauth_credentials
  has_many :active_relationships, class_name: Relationship.name,
           foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
           foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_one :image, as: :imageable, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :activities
  has_many :user_lessons
  has_many :lessons, through: :user_lessons

  def self.from_omniauth access_token
    data = access_token.info
    user = User.where(email: data["email"]).first
    user ||= User.create(name: data["name"],
                         email: data["email"],
                         password: Devise.friendly_token[0, 20],
                         confirmed_at: Time.now.utc,
                         confirmation_token: nil)
    user
  end

  enum role: [:user, :admin]

  scope :load_users, ->(id){where.not(id: id)}
end
