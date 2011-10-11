require 'spec_helper'

describe MailStats::SentMail do
  it_behaves_like "Basic Model"
  it { should have_one(:pixel) }	
  it { should have_many(:links) }
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:recipients) }
  it { should validate_presence_of(:recipients_count) }
  it { should validate_presence_of(:links_count) }
end
