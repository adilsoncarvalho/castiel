require 'spec_helper'

describe Castiel::AST::Pattern::Collection do

  before(:all) do
    class TestClass
      extend Castiel::AST::Pattern::Collection

      add_pattern /regexp/
      add_pattern ->(element) { :match_value_or_nil }
    end
  end

  after(:all) do
    Object.send :remove_const, :TestClass
  end

  it 'Should have both patterns' do
    TestClass.patterns.size.should == 2
  end

end