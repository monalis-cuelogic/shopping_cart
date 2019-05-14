class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.integer :quantity
      t.string :description
      t.string :size
      t.string :type

      t.timestamps
    end
  end
end
