require "spec_helper"

shared_examples_for "SentMail Counting Model" do
  it { should belong_to(:sent_mail) }
  it { should have_many(:visits) }
  it { should validate_presence_of(:visits_count) }
  it { should have_readonly_attribute(:visits_count) }
end