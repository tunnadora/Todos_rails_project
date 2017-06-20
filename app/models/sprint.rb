class Sprint < ApplicationRecord

has_many :todos , :dependent => :delete_all
belongs_to :organization, class_name: 'Organization', foreign_key: 'organization_id' 




end
