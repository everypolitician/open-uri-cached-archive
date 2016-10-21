require 'test_helper'
require 'json'

describe OpenUriCachedArchive do
  it 'has a version number' do
    ::OpenUriCachedArchive::VERSION.wont_be_nil
  end

  describe 'reading from the archive' do
    let(:cache) { OpenUriCachedArchive.new('test/fixtures') }

    it 'returns all the files in the archive' do
      cache.responses.size.must_equal 3
    end

    it 'has a status code' do
      cache.responses.first.status.must_equal %w(200 OK)
    end

    it 'has a content type' do
      cache.responses.first.content_type.must_equal 'application/json'
    end

    it 'has a base_uri' do
      cache.responses.first.base_uri.to_s.must_equal 'http://md5.jsontest.com/?text=baz'
    end

    it 'contains the response body' do
      JSON.parse(cache.responses.first.read, symbolize_names: true).must_equal(
        md5:      '73feffa4b7f6bb68e44cf984c85f6e88',
        original: 'baz'
      )
    end

    it 'allows you to access headers' do
      cache.responses.first.meta['server'].must_equal 'Google Frontend'
    end

    it 'contains the expected header keys' do
      cache.responses.first.meta.keys.must_equal [
        'access-control-allow-origin',
        'content-type',
        'x-cloud-trace-context',
        'date',
        'server',
        'content-length',
      ]
    end
  end
end
