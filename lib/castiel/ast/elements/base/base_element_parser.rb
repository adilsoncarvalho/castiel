module Castiel
  module AST
    module Elements
      module Base

        # Basic element parser
        class BaseElementParser
          extend  Castiel::AST::Pattern::Collection
          include Castiel::AST::Pattern::Matcher

          # Given element
          attr_reader :element

          # Default type
          def type
            :unknown
          end

          # Evaluated element
          def value
            match
          end

          # Create a new instance
          # @param [String] element to be parsed
          def initialize(element)
            @element = element.to_s
          end

          def to_s
            "[:#{type}, #{element.inspect}]"
          end
        end

      end
    end
  end
end