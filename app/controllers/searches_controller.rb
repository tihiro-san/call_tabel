class SearchesController < ApplicationController

before_action :authenticate_user!

def set_search
  @search = Contact.ransack(organization_name_cont: params[:q])
  @search_contacts = @search.result.order(created_at: :desc)#.page(params[:page])

  @search2 = User.ransack(last_name_or_first_name_cont: params[:q])
  @search_users = @search2.result.order(created_at: :desc)#.page(params[:page])

  @search3 = CallHistory.ransack(contact_organization_name_or_user_last_name_or_user_first_name_cont: params[:q] )
  @search_call_histories = @search3.result.order(created_at: :desc)#.page(params[:page])
  # binding.pry
  render :index
end



end
