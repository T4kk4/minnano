# frozen_string_literal: true

class EntryController < ApplicationController
  protect_from_forgery

  def lp
    render layout: false
  end

  def index
    @entry = Entry.new
  end

  def create
    puts entry_params
    entry = Entry.create(entry_params)
    notifier = Slack::Notifier.new(ENV['SLACK_WEBHOOK_URL'])
    msg =  <<-EOS
    税理士登録申請が届きました
    https://minnano-zeirishi.jp/manager/entries/#{entry.id}
    姓名: #{entry.user_name}
    事務所名: #{entry.office_name}
    事務所所在地: #{entry.location}
    電話番号: #{entry.phone_number}
    メールアドレス: #{entry.mail_address}
    EOS
    notifier.ping(msg)

    from = SendGrid::Email.new(email: 'nonbirin09@gmail.com')
    to = SendGrid::Email.new(email: 'niinuma@totop.jp')
    # minnzei@blueleaf-partners.co.jp
    subject = '税理士登録申請が届きました'
    content = SendGrid::Content.new(type: 'text/plain', value: msg)
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SG_API_KEY'])
    sg.client.mail._('send').post(request_body: mail.to_json)
    redirect_to root_path, notice: '内容を送信しました'
  end

  def preview
    @entry = Entry.new(entry_params)
  end

  private
  def entry_params
    params.require(:entry).permit(:tax_account_number, :user_name, :office_name, :location, :location, :phone_number, :mail_address)
  end
end
