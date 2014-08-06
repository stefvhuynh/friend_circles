class Circle < ActiveRecord::Base
  has_many(
    :memberships,
    class_name: "CircleMembership",
    foreign_key: :circle_id,
    primary_key: :id,
    inverse_of: :circle
  )

  has_many(
    :members,
    through: :memberships,
    source: :member
  )

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id,
    inverse_of: :owned_circles
  )

  validates :name, :owner_id, presence: true
  validates :name, uniqueness: { scope: :owner_id }
end
