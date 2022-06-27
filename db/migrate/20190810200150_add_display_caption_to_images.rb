class AddDisplayCaptionToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :display_caption, :boolean, default: true
  end
end
