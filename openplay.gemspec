Gem::Specification.new do |s|
  s.name = 'openplay'
  s.authors = ['Josh Adams', 'Adam Gamble']
  s.email = ['josh@isotope11.com', 'agamble@isotope11.com']
  s.summary = 'Open source air play'
  s.homepage = 'http://www.isotope11.com'
  s.description = 'Open source air play'
  s.files = `git ls-files`.split("\n")
  s.version = %q(0.0.2)

  s.files = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.executables = ['openplay']
  s.require_path = 'lib'

  s.add_dependency 'dnssd', '~> 2.0'
  s.add_dependency 'findme'
  s.add_dependency 'thor'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-matchers'
  s.add_development_dependency 'turn'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'mocha'
end
