require 'spec_helper'

describe Castiel::AST::BaseElementParser do
  let(:element) { :doesnt_matter }
  let(:subject) { Castiel::AST::BaseElementParser.new element }

  context 'Element based tests' do
    let(:element) do
      e = double(:element)
      e.should_receive(:to_s)
        .once
        .and_return('perfect')
      e
    end

    describe '#element' do
      it 'Should be converted to string' do
        subject.element.should == 'perfect'
      end
    end

    describe '#to_s' do
      it { subject.to_s.should == "[:unknown, \"perfect\"]" }
    end
  end

  describe '#type' do
    it { subject.type.should == :unknown }
  end

  describe 'Checking modules' do
    it 'Should include Matcher' do
      subject.class.included_modules.include?(Castiel::AST::Pattern::Matcher).should be_true
    end

    it 'Should extend Collection' do
      subject.class.respond_to?(:patterns).should be_true
      subject.class.respond_to?(:add_pattern).should be_true
    end
  end

end