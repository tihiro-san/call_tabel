class Admin::UsersController < ApplicationController
  
  
  def index
    @uses = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user)
    else
      render 'new'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :department, :post, :phone_number, :is_deleted, :email, :password)
  end
end
