class AddUserRefToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_reference :visitors, :user, foreign_key: true
  end
end
