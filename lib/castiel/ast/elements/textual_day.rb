module Castiel
  module AST
    module Elements

      class TextualDay < Castiel::AST::BaseDay
        add_pattern /yesterday|today|tomorrow/i

        def value
          raise "Invalid value #{element}" unless match?
          raise "Unexpected value '#{match}'" unless match.size == 1
          @value ||= element.downcase
        end

    end

    end
  end
end