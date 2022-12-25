class Admin::ValuationsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    
    @valuation = Valuation.new
    @valuations = Valuation.all
  end
  
  def create
    @valuation = Valuation.new(valuation_params)
    @valuation.save
    redirect_to admin_valuations_path, notice: "ランクが新規登録されました"
  end

  def edit
    @valuation = Valuation.find(params[:id])
  end
  
  def update
    @valuation = Valuation.find(params[:id])
    if @valuation.update(valuation_params)
      redirect_to admin_valuations_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @valuation = Valuation.find(params[:id])
    @valuation.destroy
    redirect_to admin_valuations_path
  end
  
  private
  def valuation_params
    params.require(:valuation).permit(:grade, :rank_content)
  end
end
