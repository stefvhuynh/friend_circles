class PostShare < ActiveRecord::Base
  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :shares
  )

  belongs_to(
    :circle,
    class_name: "Circle",
    foreign_key: :circle_id,
    primary_key: :id,
    inverse_of: :shares
  )

  validates :post, :circle_id, presence: true
end
