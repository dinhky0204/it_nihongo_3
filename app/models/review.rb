class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :review_comments, -> { order "created_at DESC"}
end
