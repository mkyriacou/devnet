class RemoveOwnerFromApps < ActiveRecord::Migration
  def up
    remove_column :apps, :owner_id
  end

  def down
    add_column :apps, :owner_id, :integer
  end
end
