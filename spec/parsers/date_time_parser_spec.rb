require 'spec_helper'

describe Castiel::Parsers::DateTimeParser do

  describe '#parsers' do
    it 'Should contain the following parsers' do
      subject.parsers.size.should == 3

      subject.parsers[0].class.should == Castiel::Elements::SymbolElement
      subject.parsers[1].class.should == Castiel::Elements::DateElement
      subject.parsers[2].class.should == Castiel::Elements::HourElement
    end
  end

end