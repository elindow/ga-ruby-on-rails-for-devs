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
  
  #ActiveRecord::Base.inheritance_column = "activerecordtype" 
  def self.subclasses
	[Hrp, Mp, Dp]
  end  
  
  class Hrp < Project

  end
  
  class Mp < Project
  end
  
  class Dp < Project
  end
 
  has_many :employee_projects
  has_many :employees, :through => :employee_projects
end

