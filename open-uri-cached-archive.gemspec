# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open-uri-cached-archive/version'

Gem::Specification.new do |spec|
  spec.name          = "open-uri-cached-archive"
  spec.version       = OpenUriCachedArchive::VERSION
  spec.authors       = ["Chris Mytton"]
  spec.email         = ["team@everypolitician.org"]

  spec.summary       = %q{Read responses from open-uri-cached archive directories}
  spec.homepage      = "https://github.com/everypolitician/open-uri-cached-archive"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
