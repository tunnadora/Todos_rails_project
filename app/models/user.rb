class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :organization_id, :presence => true
  belongs_to :organization, class_name: 'Organization', foreign_key: 'organization_id'
  has_many :todos

  validates :name, presence: true
  validates :age, presence: true

end
