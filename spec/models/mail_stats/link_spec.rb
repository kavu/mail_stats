require 'spec_helper'

describe MailStats::Link do
  it_behaves_like "Basic Model"
  it_behaves_like "SentMail Counting Model"
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url) }

  before(:each) { MailStats::Link.create(:url => "http://github.com/") }
end
