module Castiel
  module Elements

    class DateElement < BaseElement
      def match?(element, context = nil)
        return false unless element =~ /^\d{4}[-\/]\d{2}[-\/]\d{2}|\d{2}[-\/]\d{2}[-\/]\d{4}$/
        return false unless ::Date.parse(element) rescue nil
        true
      end

      def evaluate(element, context = nil)
        ::Date.parse(element).to_time
      end
    end

  end
end