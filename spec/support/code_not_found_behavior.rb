require 'spec_helper'

shared_examples_for "Code Not Found" do |type|
  describe "without :code" do 
    it "should be redirect to /" do
      get "process_#{type}"
      response.should redirect_to "/"
    end
    it "should be redirect to root_url when map.root route is present"
  end

  it "should return 404 on unexistent :code" do
    "MailStats::#{type.camelize}".constantize.stub!(:find).and_return false
    
    get "process_#{type}", :code => 123
    response.response_code.should eq 404
  end
end