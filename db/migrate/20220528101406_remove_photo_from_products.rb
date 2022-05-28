class RemovePhotoFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :photo, :text
  end
end
