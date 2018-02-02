class ProfileController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :getByUserId ]

  def index
    @profiles = Profile.all
  end

  def getByUserId
    email = params[:email] + "." + params[:format]
    user_id = User.find_by_email(email)
    puts user_id
    @profile = Profile.find_by_user_id(user_id)
    puts @profile
  end

  def create
    email = params[:email]
    user_id = User.find_by_email(email).id
    name = params[:name]
    profile_picture_url = params[:profile_picture_url]
    @profile = Profile.create(name: name, profile_picture_url: profile_picture_url, user_id: user_id)
    @profile.save
  end

  def update
    email = params[:email]
    user_id = User.find_by_email(email).id
    puts(user_id)
    @profile = Profile.find_by_user_id(user_id)
    @profile.name = params[:name]
    @profile.profile_picture_url = params[:profile_picture_url]
    @profile.save
  end
end
