class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.text :text
      t.integer :proj_id
      t.boolean :isCompleted
    end
  end
end
