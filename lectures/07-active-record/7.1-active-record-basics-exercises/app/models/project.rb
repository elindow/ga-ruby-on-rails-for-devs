class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name
  
  #has_many :employee_projects
  #has_many :employees, through: employee_projects
end
