class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def getUserByIndex
    @user = User.find_by_id(params[:id])
  end

  def getIdByEmail
    puts(params)
    @user_id = User.find_by_email(params[:email] + "." + params[:format]).id
  end
end
