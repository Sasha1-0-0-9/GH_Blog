class Comment < ApplicationRecord
  belongs_to :post, required: true
  belongs_to :author, required: true
  has_many :author_comment_votes

  enum status: %i[unpublished published]
  validates :body, presence: true, length: { minimum: 5 }

  def count_likes
    author_comment_votes.liked.count
  end

  def count_dislikes
    author_comment_votes.disliked.count
  end
end
