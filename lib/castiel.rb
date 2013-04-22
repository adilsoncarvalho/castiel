require "castiel/version"

module Castiel

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
