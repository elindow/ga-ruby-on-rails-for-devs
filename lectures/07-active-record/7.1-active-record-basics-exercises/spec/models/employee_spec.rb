require 'spec_helper'

describe Employee do
 
context "validations" do
		it { should validate_presence_of(:name) }  
		it { should validate_presence_of(:address) }
		it { should validate_presence_of(:start_date) }
  end

context "associations" do

		it { should belong_to :role }
	end

context "fabricators" do
	it "should fabricate an employee with a role" do
		@emp = Fabricate(:employee)
		@role = Fabricate(:role, :name => 'serf', :department => 'farming')
		#@emp.role_id = @role.id
		@emp.role = @role
				
		#@emp.should belong_to (@role)	
		@emp.role.name.should == @role.name
		@emp.role.department.should eq @role.department
		end
   end
end
