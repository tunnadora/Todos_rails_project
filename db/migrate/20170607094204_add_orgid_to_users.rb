class AddOrgidToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :orgid, :string
  end
end
