require 'spec_helper'

describe 'Castiel' do
  let(:subject) { Castiel }

  describe '.default_parser_class' do
    it{ subject.default_parser_class.should == Castiel::Parsers::DateTimeParser }
  end

  describe '.default_parser_class=' do
    class InvalidParserClass; end
    it{ lambda{ subject.default_parser_class = InvalidParserClass }.should raise_error }

    class ValidParserClass
      def parse(elements); end
    end

    it do
      subject.default_parser_class = ValidParserClass
      subject.default_parser_class.should == ValidParserClass
    end

  end

  describe '.parse' do
    it 'Should call the default parser and pass the given elements' do
      parser_double = double(:parser)
      parser_double.should_receive(:new)
        .once
        .and_return(parser_double)
      parser_double.should_receive(:parse)
        .with(:elements)
        .once
        .and_return(:parsed_elements)

      subject.should_receive(:default_parser_class)
        .once
        .and_return(parser_double)

      subject.parse(:elements).should == :parsed_elements
    end
  end

end