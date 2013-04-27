module Castiel
  module AST
    module Elements

      class SimpleHour < Castiel::AST::BaseHour
        add_pattern /^([01]?\d|2[0123])$/

        def value
          raise "Invalid value #{element}" unless match?
          raise "Unexpected value '#{match}'" unless match.size == 1
          match.first.to_i
        end
      end

    end
  end
end