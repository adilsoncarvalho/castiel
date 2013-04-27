require 'spec_helper'

describe Castiel::AST::Elements::SimpleAmPmHour do
  def try(opts)
    begin
      subject = Castiel::AST::Elements::SimpleAmPmHour.new opts[:element]
      subject.match?.should == opts[:match?]
      subject.value.should == opts[:value]
    rescue Exception => e
      raise "Failed on #{opts}: #{e}"
    end
  end

  it 'Should succeed for all AM valid values' do
    ('00'..'12').each{|val| try element: "#{val}am", match?: true, value: val.to_i }
  end

  it 'Should succeed for all PM valid values' do
    ('00'..'12').each{|val| try element: "#{val}pm", match?: true, value: val.to_i + 12 }
  end

  it { lambda{try element: '13AM', match?: false}.should raise_error }
  it { lambda{try element: '13PM', match?: false}.should raise_error }
  it { lambda{try element: '1 pm', match?: false}.should raise_error }
end