class RemoveUserIdFromDevice < ActiveRecord::Migration
  def up
    remove_column :devices, :user_id
    remove_column :users, :device_id
  end

  def down
  end
end
