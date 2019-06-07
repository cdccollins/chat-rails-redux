# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "Destroying everything"
Message.destroy_all
User.destroy_all
Channel.destroy_all

p "Creating everything"
Channel.create([{name: "general"}, {name: "london"}, {name: "react"}])
User.create([{email: "celia@celia.com", password: "123456", nickname: "Celia"}, {email: "james@james.com", password: "567891", nickname: "James"}])
Message.create([{user_id: 1, channel_id: 1, content: "Hello"}, {user_id: 2, channel_id: 1, content: "Hello there"},
                {user_id: 1, channel_id: 2, content: "Hello london"}, {user_id: 2, channel_id: 2, content: "Hello back"}])
