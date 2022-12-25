class Admin::UsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:notice] = "更新が完了しました"
      redirect_to admin_user_path(@user)
     else
      render edit_admin_user_path(@user)
     end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "登録が完了しました"
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
