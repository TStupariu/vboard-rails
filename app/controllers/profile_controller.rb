class ProfileController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

  def index
    @profiles = Profile.all
  end

  def getByUserId
    @profile = Profile.find_by_user_id(params[:id])
  end
end
