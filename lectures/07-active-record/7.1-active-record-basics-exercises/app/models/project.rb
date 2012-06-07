class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name
  
  validates_presence_of :name
  validates_presence_of :employees_count
  #validates_presence_of :type
  
  before_validation	:update_employees_count
  validate :my_method
  def update_employees_count
    puts "INSIDE BEFORE VALIDATION CALLBACK"
  end
  def my_method
  end
  #include ActiveModel::Validations
  #validates_with PValidator
  
  has_many :employee_projects
  has_many :employees, :through => :employee_projects
end

