class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :content
      t.integer :notified_by_id
      t.references :user, foreign_key: true
      t.references :notifiable, polymorphic: true
      t.boolean :checked, default: false

      t.timestamps
    end
    add_index :notifications, :notified_by_id
    add_index :notifications, [:notifiable_id, :notifiable_type]
    add_index :notifications, :checked
  end
end
