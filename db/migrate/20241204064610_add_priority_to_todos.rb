class AddPriorityToTodos < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :priority, :string
  end
end
