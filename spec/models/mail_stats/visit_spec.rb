require 'spec_helper'

describe MailStats::Visit do
  it_behaves_like "Basic Model"
  it { should belong_to(:visitable) }
  it { should belong_to(:user) }
end
