class Link < ActiveRecord::Base
  belongs_to(
    :post,
    class_name: "Link",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :links
  )
  
  validates :post_id, :url, presence: true
  validates :post_id, numericality: true
end
