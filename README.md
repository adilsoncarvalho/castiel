# Castiel [![Build Status](https://travis-ci.org/adilsoncarvalho/castiel.png?branch=master)](https://travis-ci.org/adilsoncarvalho/castiel) [![Dependency Status](https://gemnasium.com/adilsoncarvalho/castiel.png)](https://gemnasium.com/adilsoncarvalho/castiel) [![Code Climate](https://codeclimate.com/github/adilsoncarvalho/castiel.png)](https://codeclimate.com/github/adilsoncarvalho/castiel) [![Coverage Status](https://coveralls.io/repos/adilsoncarvalho/castiel/badge.png?branch=master)](https://coveralls.io/r/adilsoncarvalho/castiel)

[Castiel](http://va.mu/cUmX) was written to rescue me from hell every time I have to write any kind
of script that must deal with dates and times to be parsed on command line.

It is common to me to write summarization daemons that must accept command lines like:

`sales-count yesterday`

or

`hit-count yesterday today 11..17`

## Installation

Add this line to your application's Gemfile:

    gem 'castiel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install castiel

## Usage

````ruby
Castiel.parse 'yesterday today 1977-04-13'
# => [2013-04-21 00:00:00 -0300, 2013-04-22 00:00:00 -0300, 1977-04-13 00:00:00 -0300]
````

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
