require_relative '20191125143108_add_role_to_user'
class CancelAddingRoleColumn < ActiveRecord::Migration[5.2]
  def change
    revert AddRoleToUser
  end
end
