module Castiel
  module AST
    module Elements

      class SimpleDay < Base::BaseDay
        add_pattern ->(element) { return [Date.parse(element).to_time] rescue nil }

        def value
          raise "Invalid value #{element}" unless match?
          raise "Unexpected value '#{match}'" unless match.size == 1
          @value ||= match.first
        end

    end

    end
  end
end