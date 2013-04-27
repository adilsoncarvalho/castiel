module Castiel
  module AST

    class Parser
      def parsers
        @parsers ||= [
          Elements::SimpleHour,
          Elements::AmPmHour,
          Elements::RangeHour,
          Elements::SimpleDay,
          Elements::TextualDay
        ]
      end

      def parse(elements)
        elements = elements.split ' ' if elements.is_a? String
        elements.collect do |element|
          parsed = parse_element element
          raise "Unknown element '#{element}'" unless parsed
          parsed
        end
      end

      def parse_element(element)
        parsers.each do |klass|
          parser = klass.new element
          return parser if parser.match?
        end
        nil
      end
    end

  end
end