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
		@role.employees << @emp1
		@role.employees << @emp2
		
		@emp1.role.name.should eq @role.name
		@emp2.role.name.should eq @role.name
		end
	end
end
