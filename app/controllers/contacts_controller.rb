class ContactsController < ApplicationController
  protect_from_forgery

  def index
    @contact = Contact.new
  end

  def create
    puts contact_params
    contact = Contact.create(contact_params)
    user_type =
        if contact.user_type == 0
          "法人"
        elsif contact.user_type == 1
          "個人事業主・フリーランス"
        else
          "その他個人"
        end
    msg =  <<-EOS
    メッセージが届きました 
    https://minnano-zeirishi.jp/manager/contacts/#{contact.id}
    氏名: #{contact.user_name}
    個人 / 法人: #{user_type}
    電話番号: #{contact.phone_number}
    メールアドレス: #{contact.mail_address}
    都道府県: #{contact.prefecture}
    市区町村: #{contact.city}
    具体的な内容: #{contact.body}
    EOS

    from = SendGrid::Email.new(email: 'niinuma@totop.jp')
    to = SendGrid::Email.new(email: 'niinuma@totop.jp')
    subject = 'メッセージが届きました'
    content = SendGrid::Content.new(type: 'text/plain', value: msg)
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_APIKEY'])
    logger.debug("aaaa")
    sg.client.mail._('send').post(request_body: mail.to_json)
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
