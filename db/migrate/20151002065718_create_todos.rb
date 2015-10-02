class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.boolean :completed, default: false
      t.references :todo_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
