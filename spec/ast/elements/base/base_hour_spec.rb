require 'spec_helper'

describe Castiel::AST::Elements::Base::BaseHour do
  subject { Castiel::AST::Elements::Base::BaseHour.new :element }

  describe '#type' do
    it { subject.type.should == :hour }
  end
end