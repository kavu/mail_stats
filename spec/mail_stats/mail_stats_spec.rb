require 'spec_helper'

describe Mail do
  it "should include MailLinksInterceptor" do
    Mail.class_eval("@@delivery_interceptors").should include(MailStats::MailLinksInterceptor)
  end
  it "should include MailLinksInterceptor" do
    Mail.class_eval("@@delivery_interceptors").should include(MailStats::MailPixelInterceptor)
  end
end
