require 'spec_helper'

describe Castiel::AST::BaseDay do
  subject { Castiel::AST::BaseDay.new :element }

  describe '#type' do
    it { subject.type.should == :day }
  end
end