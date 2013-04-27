require "castiel/version"
require "castiel/ast/pattern/collection"
require "castiel/ast/pattern/matcher"

module Castiel

  module AST

    module Elements

      module Base
        autoload :BaseElementParser, 'castiel/ast/elements/base/base_element_parser'
        autoload :BaseDay,           'castiel/ast/elements/base/base_day'
        autoload :BaseHour,          'castiel/ast/elements/base/base_hour'
      end

      autoload :SimpleHour,      'castiel/ast/elements/simple_hour'
      autoload :AmPmHour,        'castiel/ast/elements/am_pm_hour'
      autoload :RangeHour,       'castiel/ast/elements/range_hour'

      autoload :SimpleDay,       'castiel/ast/elements/simple_day'
      autoload :TextualDay,      'castiel/ast/elements/textual_day'
    end
  end

  module Elements
    # elements stuff
    autoload :BaseElement,    'castiel/elements/base_element'
    autoload :DateElement,    'castiel/elements/date_element'
    autoload :HourElement,    'castiel/elements/hour_element'
    autoload :SymbolElement,  'castiel/elements/symbol_element'
  end

  module Parsers
    # parsers
    autoload :BaseParser,     'castiel/parsers/base_parser'
    autoload :DateTimeParser, 'castiel/parsers/date_time_parser'
  end

  def self.default_parser_class
    @default_parser ||= Castiel::Parsers::DateTimeParser
  end

  def self.default_parser_class=(klass)
    raise 'Parser class must have a "parse" method declared' unless klass.instance_methods.include? :parse
    @default_parser = klass
  end

  def self.parse(elements)
    default_parser_class.new.parse elements
  end

end
