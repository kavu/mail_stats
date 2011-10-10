require 'spec_helper'

describe MailStats::Pixel do
  it_behaves_like "Basic Model"

  before(:each) { MailStats::Pixel.create }

  let(:link) { MailStats::Pixel.first }
    
  it_behaves_like "Proper Visits Incrementing"
end
