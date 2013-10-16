class AddRememberTokenToDevelopers < ActiveRecord::Migration
  def change
  	 add_column :developers, :remember_token, :string
    add_index  :developers, :remember_token
  end
end
