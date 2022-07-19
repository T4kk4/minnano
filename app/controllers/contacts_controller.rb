class ContactsController < ApplicationController
  protect_from_forgery

  def index
    @contact = Contact.new
  end

  def create
    redirect_to thanks_path
  end

  def thanks
    render layout: 'thanks'
  end

  def preview
    @contact = Contact.new(contact_params)
  end

  private
  def contact_params
    params.require(:contact).permit(:user_type, :user_name, :phone_number, :mail_address, :prefecture, :city, :field_type, :body)
  end
end
