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

  describe "GET 'process_link'" do
    it_behaves_like "Code Not Found", "link"

    it "should be successful with :code" do
      link = mock(MailStats::Link)
      link.stub(:save!).and_return true
      link.stub(:visits).and_return []
      link.stub(:url).and_return "http://github.com"
      MailStats::Link.stub!(:find).and_return link

      get :process_link, :code => 123
      response.should redirect_to "http://github.com"
    end
  end
end
