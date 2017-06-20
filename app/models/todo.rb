class Todo < ApplicationRecord

   belongs_to :sprint, class_name: 'Sprint', foreign_key: 'sprint_id'
   belongs_to :user, class_name: 'User', foreign_key: 'user_id'
   
   validates :name, presence: true
   validates :name, confirmation: true



end

