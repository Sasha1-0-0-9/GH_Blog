class Post < ApplicationRecord
  belongs_to :author, class_name: 'Person', optional: true, counter_cache: :total_visitors
  has_many :comments, dependent: :destroy
  validates  :name, presence: true, length: { minimum: 3 }
  validates  :title, :content, presence: true, length: { minimum: 5, maximum: 100 }
end
