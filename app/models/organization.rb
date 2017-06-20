class Organization < ApplicationRecord

  mount_uploader :logo, LogoUploader
  has_many :users , :dependent => :delete_all
  has_many :sprints , :dependent => :delete_all
  validates :name, presence: true
  #validates :logo , presence: true

end



