require 'spec_helper'

describe MailStats::Visit do
  it { should belong_to(:visitable) }
  it { should belong_to(:user) }
end
