class CreateModerations < ActiveRecord::Migration[5.0]
  def change
    create_table :moderations do |t|
      t.string :first_name
      t.string :last_name
      t.string :reason

      t.timestamps
    end
  end
end
