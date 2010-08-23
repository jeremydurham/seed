module Seed
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.join(File.dirname(__FILE__), '..', '..', 'tasks/seeds.rake')
    end
  end
end