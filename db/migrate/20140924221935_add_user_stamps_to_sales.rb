class AddUserStampsToSales < ActiveRecord::Migration
  def change
    add_column :sales, :created_by, :integer, index: true
    add_column :sales, :updated_by, :integer, index: true
  end
  
  add_foreign_key :log_files, :users, column: "created_by"
  add_foreign_key :log_files, :users, column: "updated_by"
end
