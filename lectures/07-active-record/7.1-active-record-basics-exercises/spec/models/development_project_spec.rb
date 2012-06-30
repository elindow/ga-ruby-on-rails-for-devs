require 'spec_helper'

describe DevelopmentProject do
  it "should be a member of developmentProject" do
	@proj = Fabricate(:project, :type => 'DevelopmentProject')
	@proj.name.should eq DevelopmentProject.last.name
	end
  it "should increment DevelopmentProject count" do
	@proj = Fabricate(:project, :type => 'DevelopmentProject')  
	DevelopmentProject.count.should eq 1
  end
end
