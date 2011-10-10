require 'spec_helper'

describe MailStats::LinkController do
  before(:all) do
    Rails.application.routes.draw do
      match "/ms/r(/:code)" => "mail_stats/link#process_link"
    end
  end

  after(:all) do
    Rails.application.reload_routes!
  end

  describe "GET 'process'" do
    #TODO: Make shared behavior
    describe "without :code" do 
      it "should be redirect to /" do
        get :process_link
        response.should redirect_to "/"
      end
      
      it "should be redirect to root_url when map.root route is present"
    end

    it "should be successful with :code" do
      link = mock(MailStats::Link)
      link.stub(:increment!).with(:visits).and_return true
      link.stub(:url).and_return "http://github.com"
      MailStats::Link.stub!(:find).and_return link

      get :process_link, :code => 123
      response.should redirect_to "http://github.com"
    end

    it "should return 404 on unexistent :code" do
      MailStats::Link.stub!(:find).and_return false
      
      get :process_link, :code => 123
      response.response_code.should eq 404
    end
  end
end
