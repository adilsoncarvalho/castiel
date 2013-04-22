module Castiel
  module Elements

    class BaseElement
      def match?(element, context = nil)
        true
      end

      def evaluate(element, context = nil)
        element
      end
    end

  end
end