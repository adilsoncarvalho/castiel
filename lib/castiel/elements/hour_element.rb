module Castiel
  module Elements

    class HourElement < BaseElement
      def match?(element, context = nil)
        element =~ /^(\d|[01]\d|2[0-3])(:\d\d)?$/
      end

      def evaluate(element, context = nil)
        element.to_i
      end
    end

  end
end