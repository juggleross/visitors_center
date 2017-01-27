class AddCategoryToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_reference :visitors, :category, foreign_key: true
  end
end
