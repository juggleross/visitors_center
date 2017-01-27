class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :user_role

      t.timestamps
    end
  end
end
