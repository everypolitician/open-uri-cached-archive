require 'open-uri-cached-archive/version'
require 'yaml'
require 'stringio'
require 'open-uri'

class OpenUriCachedArchive
  class Response
    def initialize(meta_file)
      @meta = YAML.load_file(meta_file)
      @body = File.read(meta_file.gsub(/\.meta$/, ''))
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

  def initialize(path)
    @path = path
  end

  def responses
    Dir.glob(File.join(path, '**', '*.meta')).map do |meta_file|
      Response.new(meta_file).open_uri_response
    end
  end

  private

  attr_reader :path
end
