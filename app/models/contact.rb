class Contact < ApplicationRecord
  validates :body, presence: { message: 'メッセージを入力してください'}
  validates :body, length: { maximum: 10000 }
end
