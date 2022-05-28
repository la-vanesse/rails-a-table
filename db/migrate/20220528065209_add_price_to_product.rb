class AddPriceToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :price, :float
    add_column :products, :quantity, :integer
    add_column :products, :photo, :text
  end
end
