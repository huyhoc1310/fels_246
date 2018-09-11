class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :url, :image
  end
end
