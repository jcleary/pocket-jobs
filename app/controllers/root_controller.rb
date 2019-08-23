class RootController < ApplicationController
  def show
    if user_signed_in?
      redirect_to current_user.homepage_path
    else
      redirect_to new_user_session_path
    end
  end
end
