module Castiel
  module Elements

    class SymbolElement < BaseElement
      def match?(element, context = nil)
        element = element.to_s.downcase
        respond_to? "run_#{element}"
      end

      def evaluate(element, context = nil)
        element = element.to_s.downcase
        send "run_#{element}", element, context
      end

      def run_today(element, context = nil)
        ::Date.today.to_time
      end

      def run_yesterday(element, context = nil)
        (::Date.today - 1).to_time
      end

      def run_tomorrow(element, context = nil)
        (::Date.today + 1).to_time
      end
    end

  end
end