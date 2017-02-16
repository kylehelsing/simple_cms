class CreateAdminUsersPagesJoin < ActiveRecord::Migration
  def up
    create_table :admin_users_pages_join, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "page_id"
    end
    add_index :admin_users_pages_join, ["admin_user_id", "page_id"]
  end
  def down
    drop_table :admin_users_pages_join
  end
end
