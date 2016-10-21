require 'yaml'
require 'stringio'
require 'open-uri'

class OpenUriCachedArchive
  class CachedResponse
    def initialize(meta_file_path)
      @meta = YAML.load_file(meta_file_path)
      @body = File.read(meta_file_path.gsub(/\.meta$/, ''))
      @status = meta.delete(:status)
      @base_uri = meta.delete(:base_uri)
      meta.delete(:content_type)
    end

    def open_uri_response
      StringIO.new(body).tap do |response|
        OpenURI::Meta.init(response)
        meta.each { |k, v| response.meta_add_field(k, v) }
        response.status = status
        response.base_uri = base_uri
      end
    end

    private

    attr_reader :meta, :body, :status, :base_uri
  end
end
