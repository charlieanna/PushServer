class DropTablesDevelopersAppsArticlesCommentsProfiles < ActiveRecord::Migration
  def up
  	drop_table :developers
  	drop_table :apps
  	drop_table :articles
  	drop_table :comments
  	drop_table :profiles

  end

  def down
  end
end
