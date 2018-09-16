class AddCategoryIdToLessonWords < ActiveRecord::Migration[5.2]
  def change
    add_column :lesson_words, :category_id, :integer
  end
end
