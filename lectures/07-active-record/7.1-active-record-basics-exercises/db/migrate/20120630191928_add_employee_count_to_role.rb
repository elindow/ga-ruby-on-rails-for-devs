class AddEmployeeCountToRole < ActiveRecord::Migration
  def change
    add_column :roles, :employees_count, :integer, :default => 0, :null => false
  end
end
