class AddLogFileIdToSalesTable < ActiveRecord::Migration
  def change
    add_column :sales, :log_file_id, :integer, after: :merchant_name
  end

  add_foreign_key :sales, :log_files
end
