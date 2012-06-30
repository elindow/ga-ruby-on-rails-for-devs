class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name
  
  validates_presence_of :name
  validates_presence_of :employees_count
  
  before_validation	:update_employees_count
  
  protected
  def update_employees_count
		employees_count = employees.count unless employees_count.nil?
  end
 
  include ActiveModel::Validations
  validates_with PValidator
  
  
  has_many :employee_projects
  has_many :employees, :through => :employee_projects
end

