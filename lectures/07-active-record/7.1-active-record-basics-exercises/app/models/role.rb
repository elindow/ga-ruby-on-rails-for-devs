class Role < ActiveRecord::Base
  attr_accessible :department, :name
  
  has_many :employees
end
