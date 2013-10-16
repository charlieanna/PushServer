class CreateTableMessagesUsers < ActiveRecord::Migration
  def up
  	 create_table :messages_users do |t|
      t.integer :message_id
      t.integer :user_id
      t.timestamps
    end
  end

  def down
  end
end
