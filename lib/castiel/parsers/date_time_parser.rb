module Castiel
  module Parsers

    class DateTimeParser < BaseParser
      def initialize
        parsers << Castiel::Elements::SymbolElement.new
        parsers << Castiel::Elements::DateElement.new
        parsers << Castiel::Elements::HourElement.new
      end
    end

  end
end