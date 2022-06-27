class UpdateTaxAccountLink < ActiveRecord::Migration[5.2]
  def change
    add_column :tax_accountants, :google_map_link, :string
  end
end
