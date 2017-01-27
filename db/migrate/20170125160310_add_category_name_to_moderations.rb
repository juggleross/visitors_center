class AddCategoryNameToModerations < ActiveRecord::Migration[5.0]
  def change
    add_column :moderations, :category_name, :string
  end
end
