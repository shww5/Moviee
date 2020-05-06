class Movie < ApplicationRecord
  belongs_to :user
  attachment :image
end
