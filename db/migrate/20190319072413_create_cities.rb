class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string  :area
      t.string  :prefecture
      t.string  :city
    end
  end
end
