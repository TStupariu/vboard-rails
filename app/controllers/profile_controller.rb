class ProfileController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

  def index
    @profiles = Profile.all
  end

  def getByUserId
    @profile = Profile.find_by_user_id(params[:id])
  end

  def create
    email = params[:email]
    user_id = User.find_by_email(email)
    name = params[:name]
    profile_picture_url = params[:profile_picture_url]
    @profile = Profile.find_or_initialize_by(user_id: user_id)
    @profile.name = name
    @profile.profile_picture_url = profile_picture_url
    puts @profile
    @profile.save
  end
end
