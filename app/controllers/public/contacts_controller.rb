class Public::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contact_path(@contact)
    else
      render edit_contact_path(@contact)
    end
  
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    if @contact = Contact.new(contact_params)
      redirect_to user_oath(@contact)
    else
      render 'new'
    end
  end  
  
  private
  def contact_params
    params.require(:contact).permit(:organization_name, :contact_number, :contact_postcode, :contact_address, :contact_status, :counterparty_post, :counterparty_name, :employees, :website, :remarks)
  end
end
