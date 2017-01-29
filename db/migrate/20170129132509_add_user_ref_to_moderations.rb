class AddUserRefToModerations < ActiveRecord::Migration[5.0]
  def change
    add_reference :moderations, :user, foreign_key: true
  end
end
