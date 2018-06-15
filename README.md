# Textalk
Short description and motivation.

## Usage
How to use my plugin.

```ruby
Textalk::Article.list
```

```ruby
Textalk::Article.set(1234567, {
  "attributes": {
    "12345": {
      sv: "Tillverkad av 82% Polyester och 18% Elastan.",
      en: "Made of 82% Polyester and 18% Elastane."
    }
  },
  "weight": 1000
})
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'textalk'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install textalk
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
