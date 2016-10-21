require 'yaml'
require 'stringio'
require 'open-uri'

class OpenUriCachedArchive
  class CachedResponse
    def initialize(meta_file_path)
      @meta_file_path = meta_file_path
      @body = meta_file_path.sub_ext('').read
    end

    def open_uri_response
      StringIO.new(body).tap do |response|
        OpenURI::Meta.init(response)
        meta.each { |k, v| response.meta_add_field(k, v) }
        response.status = meta.delete(:status)
        response.base_uri = meta.delete(:base_uri)
      end
    end

    private

    attr_reader :meta_file_path, :body

    def meta
      @meta ||= YAML.load_file(meta_file_path).tap do |m|
        # This field already exists as "content_type" in meta, so delete it.
        m.delete(:content_type)
      end
    end
  end
end
