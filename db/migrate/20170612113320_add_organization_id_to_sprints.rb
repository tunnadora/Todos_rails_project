class AddOrganizationIdToSprints < ActiveRecord::Migration[5.0]
  def change
    add_column :sprints, :organization_id, :integer
  end
end
