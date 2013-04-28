require 'spec_helper'

describe Castiel::AST::Parser do

  describe '#parsers' do
    it { subject.parsers.include? Castiel::AST::Elements::SimpleHour }
    it { subject.parsers.include? Castiel::AST::Elements::AmPmHour }
    it { subject.parsers.include? Castiel::AST::Elements::RangeHour }
    it { subject.parsers.include? Castiel::AST::Elements::SimpleDay }
    it { subject.parsers.include? Castiel::AST::Elements::TextualDay }
  end

  describe '#parse_element' do
    before(:each) { subject.parsers.clear }

    it 'Should return nil if no parser match' do
      parser1 = double(:parser)
      parser1.should_receive(:new)
        .once
        .with(:element)
        .and_return(parser1)
      parser1.should_receive(:match?)
        .once
        .and_return(false)

      subject.parsers << parser1
      subject.parse_element(:element).should be_nil
    end

    it 'Should return an instance of the parser that match' do
      parser1 = double(:parser)
      parser1.should_receive(:new)
        .once
        .with(:element)
        .and_return(parser1)
      parser1.should_receive(:match?)
        .once
        .and_return(false)

      parser2 = double(:parser)
      parser2.should_receive(:new)
        .once
        .with(:element)
        .and_return(parser2)
      parser2.should_receive(:match?)
        .once
        .and_return(true)

      subject.parsers << parser1
      subject.parsers << parser2

      subject.parse_element(:element).should == parser2
    end
  end

  describe '#parse' do
    before(:each) { subject.parsers.clear }

    context 'Should parse both arrays or text' do
      before(:each) do
        %w(element1 element2 element3).each do |element|
          subject.should_receive(:parse_element)
            .once
            .with(element)
            .and_return(element.to_sym)
        end
      end

      it { subject.parse('element1 element2 element3').should == [:element1, :element2, :element3] }
      it { subject.parse(%w(element1 element2 element3)).should == [:element1, :element2, :element3] }
    end

    it 'Should raise error if one element did not match' do
      subject.should_receive(:parse_element)
        .once
        .with('bazzinga')
        .and_return(nil)

      lambda{ subject.parse('bazzinga') }.should raise_error
    end
  end

  describe '#compose_tree' do
    class Base
      def type
        to_s.to_sym
      end

      def to_s
        self.class.to_s.downcase
      end

    end

    class Day  < Base;  end
    class Hour < Base; end
    class Unexpected < Base; end

    def try(elements)
      expectation = elements

      # converting text into elements
      elements = elements.gsub(/\[|\]|,|\:/,'')
      elements = elements.split(' ')
      elements = elements.collect {|element| element == 'day' ? Day.new : Hour.new }

      subject.compose_tree(elements).inspect.should == expectation
    end

    it { try '[]' }
    it { try '[[hour]]' }
    it { try '[[hour], [day]]' }
    it { try '[[day, hour]]' }
    it { try '[[hour], [day, hour], [day, hour, hour], [day]]' }

    it { lambda{ subject.compose_tree([Unexpected.new]) }.should raise_error }
  end

end