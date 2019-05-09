class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :role
      t.string :password
      t.string :c_password
      t.string :gender

      t.timestamps
    end
  end
end
