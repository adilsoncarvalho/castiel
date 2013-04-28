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

      # Converts a raw list of elements into a composed tree
      # of days and times
      #
      # @param [Array] elements list of elements to compose tree
      # @return [Array] tree of composed elements
      def compose_tree(elements)
        tree = []
        leaf = []

        elements.each do |element|
          case element.type
          when :day
            tree << leaf unless leaf.empty?
            leaf = [element]

          when :hour
            # leaf << [:date, 'today'] if leaf.empty?
            leaf << element

          else
            raise "Unexpected element #{element}"
          end
        end

        tree << leaf unless leaf.empty?
        tree
      end
    end

  end
end