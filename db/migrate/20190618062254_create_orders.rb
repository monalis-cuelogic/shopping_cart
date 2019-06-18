class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :user_name
      t.integer :product_id
      t.string :price
      t.string :quantity

      t.timestamps
    end
  end
end
