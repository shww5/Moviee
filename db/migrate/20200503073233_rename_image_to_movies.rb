class RenameImageToMovies < ActiveRecord::Migration[5.2]
  def change
    rename_column :movies, :image, :image_id
  end
end
