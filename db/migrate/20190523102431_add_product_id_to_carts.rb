class AddProductIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :product_id, :string
  end
end
