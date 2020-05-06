class AddFavoriteIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :favorite_id, :integer
    add_column :favorites, :movie_id, :integer
    add_column :favorites, :user_id, :integer
  end
end
