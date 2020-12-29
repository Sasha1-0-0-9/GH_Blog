class Post < ApplicationRecord
  belongs_to :author, class_name: 'Person', optional: true, counter_cache: :total_visitors
  has_many :comments, dependent: :destroy
  validates  :name, presence: true, length: { minimum: 3 }
  validates  :title, :content, presence: true, length: { minimum: 5, maximum: 100 }

  def self.search(search)
  	if search
  		#where("title LIKE ?", "%#{search}%" "content LIKE ?", "%#{search}%")
  		where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")

  	else
  		all
  	end

end

def self.searchcont(search)
	  	if search
  		where("content LIKE ?", "%#{search}%")
  	else
  		all
  end
end

end
