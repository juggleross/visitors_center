class AddCategoryNameToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_column :visitors, :category_name, :string
  end
end
