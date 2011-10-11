require 'spec_helper'

describe MailStats::Link do
  it_behaves_like "Basic Model"
  it { should belong_to(:sent_mail) }
  it { should have_many(:visits) }
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url) }
  it { should validate_presence_of(:visits_count) }

  before(:each) { MailStats::Link.create(:url => "http://github.com/") }

  let(:link) { MailStats::Link.find_by_url "http://github.com/" }
    
  #it_behaves_like "Proper Visits Incrementing"
end
