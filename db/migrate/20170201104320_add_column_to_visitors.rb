class AddColumnToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_column :visitors, :state, :string, default: 'moderation'
  end
end
