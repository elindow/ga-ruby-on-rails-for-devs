require 'spec_helper'

describe Project do
  context "validations" do
		it { should validate_presence_of(:name) }  
		it { should validate_presence_of(:employees_count) }
  end

  context "associations" do
		it { should have_many :employee_projects }
  end
  
  context "employee count" do 
  
		it "should always be > 0" do
			employee_count should_be >= 0 
			end
		it "should equal the count of employees on the project" do
		    employee_count == self.employees.count }
			end
  end
end
