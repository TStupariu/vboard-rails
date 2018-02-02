# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
if (!User.any? and !Profile.any?)
  for i in 0..20
    u = User.create(email: "user#{i}@gmail.com", password: "password")
    u.save
    p = Profile.create(user_id: u.id, name: "Name#{i}", profile_picture_url: "http://picture.com/#{i}")
    p.save
    room = Room.create(name: "Room#{i}", password: "password", is_public: true, creator_id: u.id)
    room.save
    userRoom = UserRoom.create(user_id: u.id, room_id: room.id)
    userRoom.save
  end
end
#
# if (!Room.any?)
#   for i in 0..3
#     Room.create(name: "RoomName#{i}", password: "Password#{i}", description: "Description#{i}", )
#   end
# end