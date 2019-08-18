class ProfilesController < ApplicationController
  def index
    @children = User.children.order(:position)
  end
end
