class UpdateTaxAccountMap < ActiveRecord::Migration[5.2]
  def change
    add_column :tax_accountants, :google_map_iframe, :string
  end
end
