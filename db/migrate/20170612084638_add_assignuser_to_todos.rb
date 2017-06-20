class AddAssignuserToTodos < ActiveRecord::Migration[5.0]
  def change
    add_column :todos, :assignuser, :integer
  end
end
