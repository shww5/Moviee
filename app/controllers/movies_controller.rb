class MoviesController < ApplicationController
  before_action :authenticate_user!

  def new
    @movie = Movie.new
  end

  def create
    movie = Movie.new(movie_params)
    genres = Genre.all
    movie.user_id = current_user.id
    movie.save
    redirect_to movies_path
  end

  def index
    @Movies = Movie.all
    @q = Movie.ransack(params[:q])
    @movies = @q.result(distinct: true)
    @all_ranks = Movie.create_all_ranks
  end

  def show
    @movie = Movie.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movies_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :about, :image, :genre_id, :tag_list, :favorite_id)
  end
end
