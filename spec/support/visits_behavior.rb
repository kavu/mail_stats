require 'spec_helper'

shared_examples_for "Proper Visits Incrementing" do
   describe "visits" do
    it { link.visits.should eql 0 }
    it "should increment properly" do
      link.increment!(:visits)
      link.visits.should eql 1
    end
  end
end