require 'spec_helper'

shared_examples_for "Basic Model" do
  it { should be_present }
  it { should be_a(ActiveRecord::Base) }
end