Gem::Specification.new do |s|
  s.name         = "Ruby Game"
  s.version      = "1.0.0"
  s.author       = "Tyler Rhodes"
  s.email        = "rhodetyl000@gmail.com"
  s.homepage     = "https://tyler-rhodes-portfolio.herokuapp.com/"
  s.summary      = "A simple Ruby game built with the Pragmatic Studio"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end