require 'spec_helper'

describe Role do
  context "validations" do
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:department) }
  end

  context "associations" do
	it { should have_many :employees }
   end

  context "fabricators" do
	it "should fabricate two employees with the same role" do
		@role = Fabricate(:role, :name => 'serf', :department => 'farming')
		
		@emp1 = Fabricate(:employee)
		@emp2 = Fabricate(:employee)
		@emp1.role = @role
		@role.employees_count += 1
		@emp2.role = @role
		@role.employees_count += 1

		@emp1.role.name.should eq @role.name
		@emp2.role.name.should eq @role.name
		@role.employees_count.should eq 2
		end
	end
end
