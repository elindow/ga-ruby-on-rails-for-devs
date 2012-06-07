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
			proj = Fabricate(:project)
			emp = Fabricate(:employee)
			puts "before push e_c=>#{proj.employees_count} e.c1=>#{proj.employees.count}"
			debugger
			proj.employees << emp
			debugger
			puts "after push e_c=>#{proj.employees_count} e.c1=>#{proj.employees.count}"
			proj.employees_count.should > 0 
			end
		it "local variable should equal the db count of employees on the project" do
				@proj = Fabricate(:project, :employees_count => 0)
				6.times do
					@emp = Fabricate(:employee)
					@proj.employees << @emp
					#puts "after fab ec=>#{@proj.employees_count} ec1=>#{@proj.employees.count}"	
				end
					
		    @proj.employees_count.should == @proj.employees.count 
			end
  end
end
