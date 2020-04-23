class UsersController < ApplicationController
  def index
    @users = Users.all
  end

  def show
  end

  def new
  end
end
