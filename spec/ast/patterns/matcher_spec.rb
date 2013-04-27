require 'spec_helper'

describe Castiel::AST::Pattern::Matcher do

  before(:all) do
    class TestClass
      include Castiel::AST::Pattern::Matcher

      REGEXP = /^(\d+)$/
      LAMBDA = ->(element) { [:success] if element == :symbol }

      def self.patterns
        @patterns ||= [REGEXP, LAMBDA]
      end

      attr_accessor :element
    end
  end

  after(:all) do
    Object.send :remove_const, :TestClass
  end

  let(:subject) { TestClass.new }

  describe '#patterns' do
    it 'Should read from the class method patterns' do
      subject.patterns.size.should == 2
    end
  end

  describe '#pattern' do
    it 'Should be nil if no math run yet' do
      subject.pattern.should be_nil
    end
  end

  describe '#match? #pattern #match' do
    it 'Should match the regexp' do
      subject.element = '1234'
      subject.match?.should be_true
      subject.pattern.should == TestClass::REGEXP
      subject.match.should == ['1234']
    end

    it 'Should match the lambda' do
      subject.element = :symbol
      subject.match?.should be_true
      subject.pattern.should == TestClass::LAMBDA
      subject.match.should == [:success]
    end

    it 'Should match no one' do
      subject.element = :non_matchable
      subject.match?.should be_false
      subject.pattern.should be_nil
      subject.match.should be_nil
    end
  end

end