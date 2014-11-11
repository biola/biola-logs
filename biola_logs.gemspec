lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'biola_logs/version'

spec = Gem::Specification.new do |s|
  s.name = 'biola_logs'
  s.version = BiolaLogs::VERSION
  s.summary = 'Standardized log formatter'
  s.description = 'Standardized, opinionated log formatting'
  s.files = Dir['README.*', 'MIT-LICENSE', 'lib/**/*.rb']
  s.require_path = 'lib'
  s.author = 'Adam Crownoble'
  s.email = 'adam.crownoble@biola.edu'
  s.homepage = 'https://github.com/biola/biola-logs'
  s.license = 'MIT'
  s.add_dependency 'lograge', '~> 0.3'
end
