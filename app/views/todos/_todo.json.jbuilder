json.extract! todo, :id, :name, :state_date, :description, :assign_to, :user_id, :status, :sprint_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
