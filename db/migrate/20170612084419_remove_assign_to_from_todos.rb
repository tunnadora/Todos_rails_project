class RemoveAssignToFromTodos < ActiveRecord::Migration[5.0]
  def change
    remove_column :todos, :assign_to, :string
  end
end
