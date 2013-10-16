class AddDeveloperIdToApps < ActiveRecord::Migration
  def change
    add_column :apps, :developer_id, :integer
  end
end
