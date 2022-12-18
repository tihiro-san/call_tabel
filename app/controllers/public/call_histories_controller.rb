class Public::CallHistoriesController < ApplicationController
  def index
  end

  def show
    @call_history = CallHistory.find(params[:id])
  end

  def edit
  end

  def new
    @call_history = CallHistory.new

    @contact = Contact.find(params[:contact_id])
  end

  def create
     @contact = Contact.find(params[:contact_id])
     @call_history = CallHistory.new(call_history_params)
     #@call_history.contact_id = @contact.id
     #@call_history.user_id = current_user.id
     if @call_history.save
       redirect_to contact_call_history_path(@call_history.id)
     else
       render 'new'
     end
  end

  private
  def call_history_params
    params.require(:call_history).permit(:content)
  end
end
