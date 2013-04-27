module Castiel
  module AST
    module Elements

      class AmPmHour < Base::BaseHour
        add_pattern /^(0?\d|1[012])([ap]m)$/i

        def value
          raise "Invalid value #{element}" unless match?
          raise "Unexpected value '#{match}'" unless match.size == 2

          hour, ampm = match
          hour = hour.to_i
          ampm = ampm =~ /pm$/i ? 12 : 0

          hour + ampm
        end
      end

    end
  end
end