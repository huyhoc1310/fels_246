class Notification < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :notified_by, class_name: User.name
  belongs_to :notifiable, polymorphic: true, optional: true
  belongs_to :category, optional: true

  scope :uncheck, ->{where(checked: false)}
  scope :num_uncheck, ->{where(checked: false).count}
end
