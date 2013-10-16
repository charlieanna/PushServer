class ChangeMesageColumnBodyType < ActiveRecord::Migration
  def up
  	change_column :messages, :body, :text
  end

  def down
  end
end
