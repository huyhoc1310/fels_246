class AddStatusToUserLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :user_lessons, :status, :integer
  end
end
