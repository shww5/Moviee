class AddMovieIdToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :movie_id, :integer
    add_column :movies, :genre_id, :integer
    add_column :movies, :user_id, :integer
  end
end
