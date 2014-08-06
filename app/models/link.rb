class Link < ActiveRecord::Base
  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :links
  )

  validates :post, :url, presence: true
end
