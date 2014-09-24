class CreateLogFile < ActiveRecord::Migration
  def change
    create_table :log_files do |t|
      t.integer :rows_imported
      t.decimal :gross_revenue, precision: 2, scale: 8
      t.integer :created_by, index: true
      t.integer :updated_by, index: true
      
      t.timestamps
    end
    add_foreign_key :log_files, :users, column: "created_by"
    add_foreign_key :log_files, :users, column: "updated_by"
  end
end
