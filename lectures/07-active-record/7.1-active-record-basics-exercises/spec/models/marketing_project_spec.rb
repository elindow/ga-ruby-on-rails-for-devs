require 'spec_helper'

describe MarketingProject do
  it "should be a member of MarketingProject" do
	@proj = Fabricate(:project, :type => 'MarketingProject')
	@proj.name.should eq MarketingProject.last.name
	end
  it "should increment MarketingProject count" do
	@proj = Fabricate(:project, :type => 'MarketingProject')  
	MarketingProject.count.should eq 1
  end
end
