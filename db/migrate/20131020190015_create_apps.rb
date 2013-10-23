class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :app_name
      t.string :app_description
      t.string :app_image
      t.string :app_link
      t.string :git_link
      t.integer :owner_id 
      t.timestamps
    end
  end
end
