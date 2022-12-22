class ApplicationController < ActionController::Base
  
    before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    
    root_path
  end

  def after_sign_out_path_for(resource)
     root_path
  end
  
  before_action :set_search

  def set_search
    @query = { title_or_content_cont: params[:q] }
    @search = Contact.ransack(params[:q])
    @search_contacts = @search.result.order(created_at: :desc)#.page(params[:page])
  end
  
  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:department,:post,:phone_number])
  end
end
