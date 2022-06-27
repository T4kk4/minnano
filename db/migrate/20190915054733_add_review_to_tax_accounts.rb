class AddReviewToTaxAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :tax_accountants, :review, :integer, default: 0
  end
end
