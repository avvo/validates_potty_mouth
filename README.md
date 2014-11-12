# ValidatesPottyMouth [![Build Status](https://travis-ci.org/avvo/validates_potty_mouth.png)](https://travis-ci.org/avvo/validates_potty_mouth) [![Code Climate](https://codeclimate.com/github/avvo/validates_potty_mouth.png)](https://codeclimate.com/github/avvo/validates_potty_mouth) [![Code Coverage](https://codeclimate.com/github/avvo/validates_potty_mouth/coverage.png)](https://codeclimate.com/github/avvo/validates_potty_mouth)

Validate against blacklist of words

Originally idea conceived by [bvandenbos](https://github.com/bvandenbos). ActiveModel::Validator
to prevent bad words in your data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validates_potty_mouth'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validates_potty_mouth

## Usage

```

class Foo
  include ActiveModel::Validations
  attr_accessor :foo

  validates :foo, potty_mouth: true
end

```

## Configuration

You can set the message and threshold as configuration for the validator. The default threshold is 0.5 (half of the characters).

    validates :foo, potty_mouth: {list: :mylist, message: 'cannot be so shouty.'}

To add a word list:

    PottyMouthValidator.add_list(:my_list, '/path/to_file')

The file should have one word per line.

## Contributing

1. Fork it ( https://github.com/avvo/validates_potty_mouth/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
