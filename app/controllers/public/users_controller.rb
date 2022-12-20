class Public::UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = current_user
    @contacts = @user.contact_managers
    @call_histories = @user.call_histories
  end
end
