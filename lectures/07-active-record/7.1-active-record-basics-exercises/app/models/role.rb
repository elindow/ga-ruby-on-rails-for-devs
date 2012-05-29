class Role < ActiveRecord::Base
  attr_accessible :department, :name

  validates_presence_of :department
  validates_presence_of :name  
  
  has_many :employees
end
