require 'spec_helper'

describe HrProject do
  it "should be a member of HrProject" do
	@proj = Fabricate(:project, :type => 'HrProject')
	@proj.name.should eq HrProject.last.name
	end
  it "should increment HrProject count" do
	@proj = Fabricate(:project, :type => 'HrProject')  
	HrProject.count.should eq 1
  end
  it "should be valid" do
	@proj = Fabricate(:project, :type => 'HrProject')
	@proj.save
	HrProject.last.should be_valid
  end
end
