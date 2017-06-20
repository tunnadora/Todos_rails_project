class ChangeOrgName < ActiveRecord::Migration[5.0]
  def change
      rename_column :users, :orgid, :organization_id
  end
end
