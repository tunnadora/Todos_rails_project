class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :name
      t.date :state_date
      t.text :description
      t.string :assign_to
      t.integer :user_id
      t.string :status
      t.integer :sprint_id

      t.timestamps
    end
  end
end
