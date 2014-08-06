# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create [
  { email: "duffman@duff.com",      password: "123456" },
  { email: "homer@nuclear.com",     password: "123456" },
  { email: "lenny@nuclear.com",     password: "123456" },
  { email: "carl@nuclear.com",      password: "123456" },
  { email: "moe@tavern.com",        password: "123456" },
  { email: "bart@springfield.com",  password: "123456" },
  { email: "lisa@springfield.com",  password: "123456" },
  { email: "marge@springfield.com", password: "123456" }
]

# Circle.create [
#   { name: "Drinking buddies", owner_id: 1 }
# ]
#
# CircleMembership.create [
#   { circle_id: 1, member_id: 1 },
#   { circle_id: 1, member_id: 2 },
#   { circle_id: 1, member_id: 3 }
# ]