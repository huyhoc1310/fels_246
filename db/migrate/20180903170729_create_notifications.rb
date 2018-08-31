class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :notifiable, polymorphic: true

      t.timestamps
    end
    add_index :notifications, [:notifiable_id, :notifiable_type]
  end
end
