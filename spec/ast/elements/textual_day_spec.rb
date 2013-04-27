require 'spec_helper'

describe Castiel::AST::Elements::TextualDay do
  def try(opts)
    begin
      subject = Castiel::AST::Elements::TextualDay.new opts[:element]
      subject.match?.should == opts[:match?]
      subject.value.should == opts[:value]
    rescue Exception => e
      raise "Failed on #{opts}: #{e}"
    end
  end

  context 'Should succeed for all valid values' do
    it { try element: 'YESTERDAY', match?: true, value: 'yesterday' }
    it { try element: 'TODAY',     match?: true, value: 'today' }
    it { try element: 'TOMORROW',  match?: true, value: 'tomorrow' }
  end

  it { lambda{try element: '', match?: false}.should raise_error }
  it { lambda{try element: 'never', match?: false}.should raise_error }
end