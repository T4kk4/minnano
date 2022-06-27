class UpdateAccountGmap < ActiveRecord::Migration[5.2]
  def change
    add_column :tax_accountants, :google_map_location, :string
  end
end
