require 'spec_helper'

describe MailStats::PixelController do
  before(:all) do
    Rails.application.routes.draw do
      match "/ms/p(/:code)" => "mail_stats/pixel#process_pixel"
    end
  end

  after(:all) do
    Rails.application.reload_routes!
  end

  describe "GET 'process'" do
    #TODO: Make shared behavior
    describe "without :code" do 
      it "should be redirect to /" do
        get :process_pixel
        response.should redirect_to "/"
      end

      it "should be redirect to root_url when map.root route is present"
    end

    it "should be successful with :code" do
      pixel = mock(MailStats::Pixel)
      pixel.stub(:increment!).with(:visits).and_return true
      MailStats::Pixel.stub!(:find).and_return pixel

      get :process_pixel, :code => 123
      response.response_code.should eq 204
    end

    it "should return 404 on unexistent :code" do
      MailStats::Pixel.stub!(:find).and_return false
      
      get :process_pixel, :code => 123
      response.response_code.should eq 404
    end
  end
end
