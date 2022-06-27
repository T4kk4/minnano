class ChangeContactsColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :city, :string
    remove_column :contacts, :field_type
  end
end
