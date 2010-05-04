class Seed
  VERSION = '1.0'
  
  def self.plant(klass, name, attributes={}, &block)    
    raise RuntimeError, "You cannot overwrite an existing seed" if self.planted?(klass, name)
    
    if block_given?
      @seeds[klass][name] = klass.create!(&block)
    else
      @seeds[klass][name] = klass.create!(attributes)
    end
  end

  def self.retrieve(klass, name)
    self.planted?(klass, name) || raise(RuntimeError, "No seed #{name} for #{klass}")
  end

  def self.planted?(klass, name)
    @seeds ||= {}
    @seeds[klass] ||= {}
    @seeds[klass][name]
  end
end

class ActiveRecord::Base
  def self.seed(*options, &block)
    if block_given?
      Seed.plant(self, options.first, &block)
    else
      if options.length > 1
        Seed.plant(self, options.first, options.last)
      else
        Seed.retrieve(self, options.first)
      end
    end
  end
end