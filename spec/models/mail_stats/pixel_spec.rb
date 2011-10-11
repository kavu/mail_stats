require 'spec_helper'

describe MailStats::Pixel do
  it_behaves_like "Basic Model"
  it_behaves_like "SentMail Counting Model"
end
