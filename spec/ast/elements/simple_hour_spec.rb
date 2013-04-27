require 'spec_helper'

describe Castiel::AST::Elements::SimpleHour do
  def try(opts)
    begin
      subject = Castiel::AST::Elements::SimpleHour.new opts[:element]
      subject.match?.should == opts[:match?]
      subject.value.should == opts[:value]
    rescue Exception => e
      raise "Failed on #{opts}: #{e}"
    end
  end

  it 'Should succeed for all valid values' do
    ('00'..'23').each{|val| try element: val, match?: true, value: val.to_i }
  end

  it { lambda{try element: '24', match?: false}.should raise_error }
end