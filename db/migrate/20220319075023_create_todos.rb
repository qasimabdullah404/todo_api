class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :task, null: false
      t.boolean :task_completed, default: false

      t.timestamps
    end
  end
end
