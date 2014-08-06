class Comment < ActiveRecord::Base
  belongs_to(
    :commenter,
    class_name: "User",
    foreign_key: :commenter_id,
    primary_key: :id,
    inverse_of: :comments
  )

  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :comments
  )

  validates :body, :commenter_id, :post_id, presence: true
end
