class Public::CallHistoriesController < ApplicationController
  def index
    @call_histories = CallHistory.all

  end

  def show
    @call_history = CallHistory.find(params[:id])
    @contact = Contact.find(params[:contact_id])
  end

  def edit
    @call_history = CallHistory.find(params[:id])
    @contact = Contact.find(params[:contact_id])
    @call_history.contact_id = params[:contact_id]
  end

  def update
    @call_history = CallHistory.find(params[:id])
    @call_history.contact_id = params[:contact_id]
    @call_history.user_id = current_user.id
    if @call_history.update(call_history_params)
       flash[:notice] = "コール履歴が更新されました"
       redirect_to contact_call_history_path(@call_history.contact_id, @call_history.id)
    else
      flash[:notice] = "コール履歴を更新できませんでした"
       render 'edit'
    end
  end

  def new
    @call_history = CallHistory.new

    @contact = Contact.find(params[:contact_id])
  end

  def create

     @call_history = CallHistory.new(call_history_params)
     @call_history.contact_id = params[:contact_id]
     @call_history.user_id = current_user.id
     if @call_history.save
       flash[:notice] = "コール履歴が登録されました"
       redirect_to contact_call_history_path(@call_history.contact_id, @call_history.id)
     else
       flash[:notice] = "コール履歴を登録できませんでした"
       render 'new'
     end
  end

  private
  def call_history_params
    params.require(:call_history).permit(:content, :valuation_id)
  end
end
