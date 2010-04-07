class Seedling
  def self.plant(klass, name, attributes)
    raise RuntimeError, "You cannot overwrite an existing seed" if self.planted?(klass, name)
    @seeds[klass][name] = klass.create!(attributes)
  end

  def self.retrieve(klass, name)
    self.planted?(klass, name) || raise("No seed #{name} for #{klass}")
  end

  def self.planted?(klass, name)
    @seeds ||= {}
    @seeds[klass] ||= {}
    @seeds[klass][name]
  end
end

class ActiveRecord::Base
  def self.seed(*options)
    if options.length > 1
      Seedling.plant(self, options.first, options.last)
    else
      Seedling.retrieve(self, options.first)
    end
  end
end