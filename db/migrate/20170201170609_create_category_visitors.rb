class CreateCategoryVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :category_visitors do |t|
      t.string :category
      t.references :visitor, foreign_key: true

      t.timestamps
    end
  end
end
