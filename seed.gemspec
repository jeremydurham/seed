# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{seed}
  s.version = "1.1.0.pre"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeremy Durham"]
  s.date = %q{2010-08-23}
  s.description = %q{Another simple seeding library}
  s.email = %q{jeremydurham@gmail.com}
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["LICENSE", "README.md", "Rakefile", "lib/seed", "lib/seed/base.rb", "lib/seed/railtie.rb", "lib/seed/task.rb", "lib/seed.rb", "spec/db", "spec/db/schema.rb", "spec/seed_spec.rb", "tasks/seeds.rake"]
  s.homepage = %q{}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Another simple seeding library}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
