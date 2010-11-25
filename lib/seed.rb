require File.join(File.dirname(__FILE__), 'seed', 'railtie') if defined?(Rails)
require File.join(File.dirname(__FILE__), 'seed', 'base')
require File.join(File.dirname(__FILE__), 'seed', 'version')

class MissingRowError  < StandardError; end
class MissingSeedError < StandardError; end
class SeedOverwriteError < StandardError; end