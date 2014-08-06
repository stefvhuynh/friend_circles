class Post < ActiveRecord::Base
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id,
    inverse_of: :posts
  )
  
  has_many(
    :links,
    class_name: "Link",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :post
  )
  
  has_many(
    :shares,
    class_name: "PostShare",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :post
  )
  
  has_many(
    :shared_circles,
    through: :shares,
    source: :circle
  )
  
  validates :title, :body, :author_id, presence: true
  validates :author_id, numericality: true
end
