require 'spec_helper'

describe Castiel::AST::Elements::SimpleDay do
  def try(opts)
    begin
      subject = Castiel::AST::Elements::SimpleDay.new opts[:element]
      subject.match?.should == opts[:match?]
      subject.value.should == opts[:value]
    rescue Exception => e
      raise "Failed on #{opts}: #{e}"
    end
  end

  context 'Should succeed for all valid values' do
    it { try element: '1977-03-14', match?: true, value: Date.parse('1977-03-14').to_time }
    it { try element: 'Sat, 27 Apr 2013', match?: true, value: Date.parse('2013-04-27').to_time }
  end

  it { lambda{try element: '2013-02-31', match?: false}.should raise_error }
end