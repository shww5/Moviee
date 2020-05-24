class Movie < ApplicationRecord
  belongs_to :user
  attachment :image
  acts_as_taggable
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre

  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end

  def self.create_all_ranks
    # Movie.find(Favorite.group(:movie_id).order("count(favorites.movie_id desc").limit(3).pluck(:movie_id))
    # Moveisとfavoritesを内部結合し,moview_idたんいでFavoritesが多い順に並べる
    Movie.joins(:favorites).group("favorites.movie_id").order("count(*) desc").limit(3)
  end

end
