class UsersController < ApplicationController
  def index
    @users = User.where(role: 1)
  end
end
