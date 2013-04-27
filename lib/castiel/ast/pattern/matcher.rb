module Castiel
  module AST
    module Pattern

      module Matcher
        # List of patterns
        def patterns
          self.class.patterns
        end

        # Checks if the given element matches any pattern
        # @return [TrueClass] if matched
        def match?
          patterns.each do |pattern|
            result = if pattern.respond_to? :yield
              pattern.yield element
            else
              element.to_s.scan(pattern).flatten
            end

            unless result.nil? || result.empty?
              @pattern = pattern
              @match   = result
              return true
            end
          end

          @pattern = nil
          @match   = nil
          false
        end

        # Pattern that matched element or nil if none
        # @return [Regexp,Lambda,Proc]
        def pattern
          @pattern
        end

        # Value matched or nil if none
        # @return [Array] with the values matched
        def match
          @match
        end
      end

    end
  end
end