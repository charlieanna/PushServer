class AddAppIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :app_id, :integer
  end
end
