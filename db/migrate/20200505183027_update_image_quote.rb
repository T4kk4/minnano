class UpdateImageQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :quote_url, :string
    change_column_default :images, :display_quote, to: true
    change_column_default :images, :display_caption, from: true, to: false
  end
end
