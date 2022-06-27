class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_type, default: 0, null: false
      t.string  :user_name
      t.string  :phone_number
      t.string  :mail_address
      t.string  :prefecture
      t.integer :field_type, default: 0, null: false
      t.text :body

      t.timestamps
    end
  end
end
