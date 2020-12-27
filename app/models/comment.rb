class Comment < ApplicationRecord
  belongs_to :post, required: true
  belongs_to :author, required: true
  enum status: %i[unpublished published]
  validates :body, presence: true, length: { minimum: 5 }
end
