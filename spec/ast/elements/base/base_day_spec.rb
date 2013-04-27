require 'spec_helper'

describe Castiel::AST::Elements::Base::BaseDay do
  subject { Castiel::AST::Elements::Base::BaseDay.new :element }

  describe '#type' do
    it { subject.type.should == :day }
  end
end