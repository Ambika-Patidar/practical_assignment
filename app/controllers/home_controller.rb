class HomeController < ApplicationController
  def index
    return if current_user.present?

    flash[:info] = 'You need to sign in first'
    redirect_to new_user_session_path, info: 'You need to sign in first'
  end
end
