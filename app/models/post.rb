class Post < ApplicationRecord
  belongs_to :author, class_name: 'Person', optional: true, counter_cache: :total_visitors
  has_many :comments, dependent: :destroy
  validates :title, :content, presence: true, length: { minimum: 5, maximum: 10000 }

  mount_uploader :img, ImageUploader

  def self.search(search)
    if search
      where('title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%")

    else
      all
    end
  end
end
