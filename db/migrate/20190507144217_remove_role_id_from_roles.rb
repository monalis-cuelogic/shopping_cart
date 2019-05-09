class RemoveRoleIdFromRoles < ActiveRecord::Migration[5.2]
  def change
    remove_column :roles, :role_id, :integer
  end
end
