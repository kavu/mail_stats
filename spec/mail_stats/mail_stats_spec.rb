require 'spec_helper'

describe Mail do
  it "should include MailStats::MailStatsInterceptor" do
  	Mail.class_eval("@@delivery_interceptors").should include(MailStats::MailStatsInterceptor)
  end
end
