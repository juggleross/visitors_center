class AddCategoryToModerations < ActiveRecord::Migration[5.0]
  def change
    add_reference :moderations, :category, foreign_key: true
  end
end
