class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :user_lesson, foreign_key: true
      t.references :word, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
