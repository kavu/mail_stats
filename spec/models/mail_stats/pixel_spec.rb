require 'spec_helper'

describe MailStats::Pixel do
  it_behaves_like "Basic Model"
  it { should belong_to(:sent_mail) }
  it { should have_many(:visits) }
  it { should validate_presence_of(:visits_count) }

  #before(:each) { MailStats::Pixel.create }

  #let(:link) { MailStats::Pixel.first }
    
  #it_behaves_like "Proper Visits Incrementing"
end
