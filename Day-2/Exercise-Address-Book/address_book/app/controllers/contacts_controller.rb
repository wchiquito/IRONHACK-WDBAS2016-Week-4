class ContactsController < ApplicationController
  def index
    @contacts = Contact.order(:name)
    @contacts_count = @contacts.count
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def new

  end

  def create
    contact = Contact.new(
        :name => params[:contact][:name],
        :address => params[:contact][:address],
        :phone => params[:contact][:phone],
        :email => params[:contact][:email]
    )
    contact.save
    redirect_to root_path
  end
end
