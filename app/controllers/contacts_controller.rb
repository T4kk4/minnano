class ContactsController < ApplicationController
  protect_from_forgery

  def index
    @contact = Contact.new
  end

  def create
    puts contact_params
    contact = Contact.create(contact_params)
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping("a")
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
