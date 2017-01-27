class AddDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :role_id, Role.find_by(user_role:"user").id
  end
end
