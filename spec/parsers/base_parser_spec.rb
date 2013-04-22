require 'spec_helper'

describe Castiel::Parsers::BaseParser do

  describe '#parsers' do
    it{ subject.parsers.empty?.should be_true }
  end

  describe '#<<' do
    it 'Should add element parsers into parsers list' do
      subject << :element1
      subject << :element2
      subject << :element3

      subject.parsers.should == [:element1, :element2, :element3]
    end
  end

  describe '#parse' do
    before(:each) do
      subject.should_receive(:parse_element)
        .with('element1')
        .once
        .and_return('element1')
      subject.should_receive(:parse_element)
        .with('element2')
        .once
        .and_return('element2')
      subject.should_receive(:parse_element)
        .with('element3')
        .once
        .and_return('element3')
    end

    it{ subject.parse('element1 element2 element3').should == %w(element1 element2 element3) }
    it{ subject.parse(%w(element1 element2 element3)).should == %w(element1 element2 element3) }
  end

  describe '#parse_element' do
    it 'Should evaluate for the element who says match and stop' do
      e1 = double(:element_1)
      e1.should_receive(:match?)
        .with(:element)
        .and_return(false)

      e2 = double(:element_2)
      e2.should_receive(:match?)
        .with(:element)
        .and_return(true)
      e2.should_receive(:evaluate)
        .with(:element, nil)
        .and_return(:success)

      e3 = double(:element_3)
      e3.should_receive(:match?)
        .with(:element)
        .exactly(0)

      subject << e1
      subject << e2
      subject << e3

      subject.parse_element(:element).should == :success
    end

    it 'Should return nil if no element says match' do
      e1 = double(:element_1)
      e1.should_receive(:match?)
        .with(:element)
        .and_return(false)

      e2 = double(:element_2)
      e2.should_receive(:match?)
        .with(:element)
        .and_return(false)

      e3 = double(:element_3)
      e3.should_receive(:match?)
        .with(:element)
        .and_return(false)

      subject << e1
      subject << e2
      subject << e3

      subject.parse_element(:element).should be_nil
    end
  end

end