# open-uri-cached-archive

Ruby library for reading responses from [open-uri-cached][] archive directories.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open-uri-cached-archive'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install open-uri-cached-archive

## Usage

Create a new instance of `OpenUriCachedArchive`, passing it the path to the directory created by [open-uri-cached][]. Then you can read the responses out of the archive and iterate through them. Each response has the same methods as a response from `open-uri`.

```ruby
require 'open-uri-cached-archive'

OpenUriCachedArchive.new('.cache').responses.each do |response|
  # response has the same methods as a regular open-uri response
  response.read         # => "<!DOCTYPE html>\n<html>\n<head>..."
  response.status       # => ["200", "OK"]
  response.content_type # => "text/html"
  response.meta         # => {"cache-control"=>"max-age=604800", [...] }
  response.base_uri     # => #<URI::HTTP http://example.com/>
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/everypolitician/open-uri-cached-archive.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[open-uri-cached]: https://github.com/tigris/open-uri-cached
