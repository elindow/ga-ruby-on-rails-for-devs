require 'spec_helper'

describe Role do
  context "validations" do
	it { should_validate_presence_of :name, :department }
    #TODO: Add validations ensuring presence of all fields
  end

  context "associations" do
    #TODO: Add specs to check for associations
  end

  context "fabricators" do
    #TODO: Add specs to ensure that fabricators create valid objects
  end
end
