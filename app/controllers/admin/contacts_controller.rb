class Admin::ContactsController < ApplicationController
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
      redirect_to admin_contact_path(@contact)
    else
      render edit_admin_contact_path(@contact)
    end

  end

  def new
    @contact = Contact.new
  end

  def create
    if @contact = Contact.create(contact_params)
      
      redirect_to admin_contact_path(@contact)
    else
      render 'new'
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:organization_name, :contact_number, :contact_postcode, :contact_address, :contact_status, :counterparty_post, :counterparty_name, :employees, :website, :remarks)
  end
end
