module Castiel
  module AST
    module Pattern

      module Collection

        # Array of patterns
        def patterns
          @patterns ||= []
        end

        # Adds a new pattern
        # @param [Regexp,Lambda,Proc] pattern pattern to add to the list
        def add_pattern(pattern)
          patterns << pattern
        end
      end

    end
  end
end