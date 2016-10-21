require 'open-uri-cached-archive/version'
require 'open-uri-cached-archive/cached_response'

class OpenUriCachedArchive
  def initialize(path)
    @path = path
  end

  def responses
    Dir.glob(File.join(path, '**', '*.meta')).map do |meta_file_path|
      CachedResponse.new(meta_file_path).open_uri_response
    end
  end

  private

  attr_reader :path
end
