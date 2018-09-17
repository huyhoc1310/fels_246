class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_notification, only: :checked

  def checked
    @notification.update_attributes checked: true
    redirect_to category_path @notification.notifiable_id
  end

  private

  def load_notification
    @notification = Notification.find_by id: params[:id]
    return if @notification
    flash[:danger] = t "flashs.not_found_notification"
    redirect_to root_path
  end
end
