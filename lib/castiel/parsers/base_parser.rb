module Castiel
  module Parsers

    class BaseParser
      def parsers
        @parsers ||= []
      end

      def <<(element)
        parsers << element
      end

      def parse(elements)
        elements = elements.split ' ' if elements.is_a? String
        elements.collect{|element| parse_element element}
      end

      def parse_element(element, context = nil)
        parsers.each do |parser|
          return parser.evaluate(element, context) if parser.match? element
        end
        nil
      end
    end

  end
end