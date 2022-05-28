class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :event_type
      t.string :product_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
