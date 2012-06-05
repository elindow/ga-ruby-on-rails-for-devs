require 'spec_helper'

describe EmployeeProject do
	it "should add entries to table upon association" do
		@emp = Fabricate(:employee)
		@pro = Fabricate(:project)
		@emp.projects << @pro
		@pro.employees.last.id.should eq @emp.id
		@emp.projects.last.id.should eq @pro.id
	end
end
