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

  describe "GET 'process_pixel'" do
    it_behaves_like "Code Not Found", "pixel"

    it "should be successful with :code" do
      pixel = mock(MailStats::Pixel)
      pixel.stub(:save!).and_return true
      pixel.stub(:visits).and_return []
      MailStats::Pixel.stub!(:find).and_return pixel

      get :process_pixel, :code => 123
      response.response_code.should eq 204
    end
  end
end
