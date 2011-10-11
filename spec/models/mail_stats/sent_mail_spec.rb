require 'spec_helper'

describe MailStats::SentMail do
  it { should have_one(:pixel) }	
  it { should have_many(:links) }
end
