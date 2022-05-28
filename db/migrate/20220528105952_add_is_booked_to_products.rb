class AddIsBookedToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :is_booked, :boolean
  end
end
