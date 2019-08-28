class UsersController < ApplicationController
  load_and_authorize_resource :user

  def index
    @children = @users.children.order(:position)
  end
end
