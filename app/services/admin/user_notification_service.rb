class Admin::UserNotificationService
  def initialize user
    @user = user
  end

  def notify category
    User.load_users(@user.id).each do |user|
      category.notifications.create! content: I18n.t("content"),
        notified_by_id: @user.id, user_id: user.id
    end
  end
end
