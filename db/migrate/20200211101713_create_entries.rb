class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :tax_account_number
      t.string :user_name
      t.string :office_name
      t.string :location
      t.string :phone_number
      t.string :mail_address

      t.timestamps
    end
  end
end
