class AdminUsersController < ApplicationController
  before_action :authenticate_admin_user!
  def show
    @admin_user = current_admin_user
    @posts = @admin_user.posts
  end
end
