class UpdateTaxAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :tax_accountants, :fee_contents, :text
    add_column :tax_accountants, :case_contents, :text
  end
end
