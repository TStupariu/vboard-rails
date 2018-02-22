class RoomsController < ApplicationController
  def index
    @list = []
    @rooms = Room.includes(:user).all
    @rooms.each do |room|
      puts room.user
      @list.push({'room': room, creator: room.user})
    end
  end

  def create
    puts(params[:name], params[:isPrivate], params[:password], params[:creatorEmail])
    isPublic = !params[:isPrivate]
    creatorId = User.find_by_email(params[:creatorEmail]).id
    @room = Room.create(name: params[:name], is_public: isPublic, password: params[:password], creator_id: creatorId)
    @room.save
  end

  def getPublicRooms
    @list = []
    @rooms = Room.includes(:user).all.where('is_public = ?', true)
    @rooms.each do |room|
      profile = Profile.find_by_user_id(room.user.id)
      @list.push({'room': room, creator: profile})
    end
  end

  def getRoomParticipants
    participantUsers = Room.find_by_id(params[:room_id]).users
    @participants = []
    for p in participantUsers
      profile = Profile.find_by_user_id(p.id)
      @participants.push(profile)
    end
  end

  def joinPublicRoom
    user_id = User.find_by_email(params[:user_email]).id
    @userRoom = UserRoom.create(user_id: user_id, room_id: params[:room_id])
    @userRoom.save
  end

  def getRoomById
    room_id = params[:id]
    @room = Room.find_by_id(room_id)
    participantUsers = @room.users
    @participants = []
    for p in participantUsers
      profile = Profile.find_by_user_id(p.id)
      @participants.push(profile)
    end
  end

  def userIsOwner
    puts(params)
    user_id = User.find_by_email(params[:user_email] + "." + params[:format]).id
    room_id = params[:room_id]
    room = Room.find_by_id(room_id)
    @isOwner = room.creator_id == user_id
  end
end
