require 'spec_helper'

describe Castiel::AST::Elements::SimpleRangeHour do
  def try(opts)
    begin
      subject = Castiel::AST::Elements::SimpleRangeHour.new opts[:element]
      subject.match?.should == opts[:match?]
      subject.value.should == opts[:value]
    rescue Exception => e
      raise "Failed on #{opts}: #{e}"
    end
  end

  context 'Should succeed for all valid values' do
    it { try element: '0..23', match?: true, value: (0..23) }
    it { try element: '..10', match?: true, value: (0..10) }
    it { try element: '10..', match?: true, value: (10..23) }
  end

  it { lambda{try element: '..24', match?: false}.should raise_error }
  it { lambda{try element: '20..10', match?: false}.should raise_error }
end