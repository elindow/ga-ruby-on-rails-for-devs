require 'spec_helper'

describe Employee do
  context "validations" do
	before(:each) do
		@employee = Fabricate(:employee)
	end
    #it { should_validate_presence_of :name, :address, :start_date }
	@employee.name should be_valid
    #TODO: Add validations for remaining fields
  end

  context "associations" do
    #TODO: Add specs to check for associations
  end

  context "fabricators" do
    #TODO: Add specs to ensure that fabricators create valid objects
  end
end
