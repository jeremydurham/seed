Gem::Specification.new do |s|
  s.name = 'seed'
  s.version = '1.0.3'
  s.summary = 'Another simple seeding library for Rails'
  s.authors = ["Jeremy Durham"]
  s.date = Date.today 
  s.email = 'jeremydurham@gmail.com'
  s.files = Dir['lib/**/*.rb'] + Dir['tasks/**/*.rake'] + Dir['spec/**/*.rb'] + ['README.md']
  s.has_rdoc = true
  s.homepage = 'http://www.jeremydurham.com'
  s.rubygems_version = '1.3.1'
end
