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

end