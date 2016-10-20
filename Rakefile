require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new

task default: %i(test rubocop)

desc 'Generate some fixture data in test/fixtures'
task :generate_test_data do
  require 'open-uri/cached'
  OpenURI::Cache.cache_path = 'test/fixtures'
  %w(foo bar baz).each do |word|
    open("http://md5.jsontest.com/?text=#{word}")
  end
end
