class CircleMembership < ActiveRecord::Base
  belongs_to(
    :circle,
    class_name: "Circle",
    foreign_key: :circle_id,
    primary_key: :id,
    inverse_of: :memberships
  )

  belongs_to(
    :member,
    class_name: "User",
    foreign_key: :member_id,
    primary_key: :id,
    inverse_of: :memberships
  )

  validates :circle_id, :member_id, presence: true
end
