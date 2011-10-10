require 'spec_helper'

describe MailStats::Link do
  it_behaves_like "Basic Model"

  before(:each) { MailStats::Link.create(:url => "http://github.com/") }

  let(:link) { MailStats::Link.find_by_url "http://github.com/" }
    
  it_behaves_like "Proper Visits Incrementing"
end
