class CreateEmployeeProjectsJoinTable < ActiveRecord::Migration
  def up
	create_table :employee_projects do |t|
		t.integer :employee_id
		t.integer :project_id
	end	
  end

  def down
	drop_table :employees_projects
  end
end
