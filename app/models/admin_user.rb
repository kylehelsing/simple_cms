class AdminUser < ActiveRecord::Base
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits
  # To configure a different table name:
  # self.table_name = "admin_users"

end
