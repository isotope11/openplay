Gem::Specification.new do |s|
  s.name = 'OpenPlay'
  s.authors = ['Josh Adams', 'Adam Gamble']
  s.summary = 'Open source air play'
  s.description = 'Open source air play'
  s.files = `git ls-files`.split("\n")
  s.version = %q(0.0.1)

  s.add_dependency 'dnssd', '~> 2.0'
  s.add_dependency 'findme'
  s.add_dependency 'thor'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-matchers'
  s.add_development_dependency 'turn'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'mocha'
end
