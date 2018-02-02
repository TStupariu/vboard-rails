class RoomsController < ApplicationController
  def index
    @list = []
    @rooms = Room.includes(:user).all
    @rooms.each do |room|
      puts room.user
      @list.push({'room': room, creator: room.user})
    end
  end

  def getPublicRooms
    # @rooms = Room.all.where('is_public = ?', true)
    @list = []
    @rooms = Room.includes(:user).all.where('is_public = ?', true)
    @rooms.each do |room|
      profile = Profile.find_by_user_id(room.user.id)
      @list.push({'room': room, creator: profile})
    end
  end
end
