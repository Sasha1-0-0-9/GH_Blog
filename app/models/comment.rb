class Comment < ApplicationRecord
  belongs_to :post, required: true
  belongs_to :author, required: true
  has_many :author_comment_votes
  has_ancestry

  validates :body, presence: true

  def count_likes
    author_comment_votes.liked.count
  end

  def count_dislikes
    author_comment_votes.disliked.count
  end
end
