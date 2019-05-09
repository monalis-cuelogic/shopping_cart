class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
  	t.remove :role_id
  end
end
