# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    # flash[:notice] = "Welcome! You have signed up successfully."
    root_path
  end
  
  protected
  # 退会しているかを判断するメソッド
  def user_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得  
    @user = User.find_by(email: params[:user][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別  
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
      ## 【処理内容3】
      redirect_to new_user_session_path, notice: "アカウントが無効です"
    end
  end 
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
