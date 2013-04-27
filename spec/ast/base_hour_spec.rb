require 'spec_helper'

describe Castiel::AST::BaseHour do
  subject { Castiel::AST::BaseHour.new :element }

  describe '#type' do
    it { subject.type.should == :hour }
  end
end