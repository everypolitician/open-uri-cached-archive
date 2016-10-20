# open-uri-cached-archive

Ruby library for reading responses from [open-uri-cached][] archive directories.

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

[open-uri-cached]: https://github.com/tigris/open-uri-cached
