class AddGenreIdToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :genre_id, :integer
  end
end
