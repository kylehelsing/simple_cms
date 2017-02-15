class AdminUser < ActiveRecord::Base
  has_and_belongs_to_many :pages
  # To configure a different table name:
  # self.table_name = "admin_users"

end
