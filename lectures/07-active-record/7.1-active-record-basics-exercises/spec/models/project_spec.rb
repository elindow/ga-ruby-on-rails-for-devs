require 'spec_helper'

describe Project do
  context "validations" do
		it { should validate_presence_of(:name) }  
		it { should validate_presence_of(:employees_count) }
  end

  context "associations" do
		it { should have_many :employee_projects }
  end
  
  context "fabricators" do
	it "should be valid" do
		@proj = Fabricate.build(:project, :name => 'dig moat')
		@proj.name.should eq 'dig moat'
	end
  end
  
  context "employees count" do 
		it "should always be > 0" do
			@proj = Fabricate(:project, :employees_count => -1)
			@emp = Fabricate(:employee)
			@proj.employees << @emp
			
			@proj.employees_count.should > 0 
			end
		it "should equal the count of employees on the project" do
			@proj = Fabricate(:project, :employees_count => -1)
			@emp = Fabricate(:employee)
			@proj.employees << @emp
			
		    @proj.employees_count.should == @proj.employees.count 
			end
  end
end
