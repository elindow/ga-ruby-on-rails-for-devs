class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name
  
  validates_presence_of :name
  validates_presence_of :employees_count
  
  before_validation	:ensure_employees_count_is_positive
  
  protected
  def ensure_employees_count_is_positive
		puts "bv ec=#{employees_count}" unless employees_count.nil?
		puts "bv ec1=#{self.employees.count}"
  end
 
  include ActiveModel::Validations
  validates_with PValidator
 
  has_many :employee_projects
  has_many :employees, :through => :employee_projects
end

