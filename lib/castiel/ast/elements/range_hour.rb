module Castiel
  module AST
    module Elements

      class RangeHour < Base::BaseHour
        add_pattern /^()\.\.([01]?\d|2[0123])$/
        add_pattern /^([01]?\d|2[0123])\.\.([01]?\d|2[0123])$/
        add_pattern /^([01]?\d|2[0123])\.\.()$/

        def min
          0
        end

        def max
          23
        end

        def value
          raise "Invalid value #{element}" unless match?
          raise "Unexpected value '#{match}'" unless match.size == 2
          @value ||= begin
            start, finish = match
            start  = start.to_s.empty?  ? min : start.to_i
            finish = finish.to_s.empty? ? max : finish.to_i

            start..finish
          end
        end
      end

    end
  end
end