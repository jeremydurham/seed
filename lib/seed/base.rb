module Seed
  class Base
    VERSION = '1.1.0.pre'
    @seeds = {}
  
    def self.plant(klass, name, attributes={}, &block)
      raise RuntimeError, "You cannot overwrite an existing seed" if self.planted?(klass, name)

      if block_given?
        @seeds[klass][name] = klass.create!(&block)
      else
        seed = klass.new
        attributes.each do |attribute, value|
          seed.send(:"#{attribute}=", value)
        end
        seed.save!
        @seeds[klass][name] = seed
      end
    end

    def self.retrieve(klass, name)
      self.planted?(klass, name) || raise(RuntimeError, "No seed #{name} for #{klass}")
    end

    def self.planted?(klass, name)
      @seeds[klass] ||= {}
      @seeds[klass][name]
    end
  
    def self.row(klass)
      @seeds[klass]
    end
  end
end

class ActiveRecord::Base
  def self.seed(*options, &block)
    if block_given?
      Seed::Base.plant(self, options.first, &block)
    else
      if options.length > 1
        Seed::Base.plant(self, options.first, options.last)
      else
        Seed::Base.retrieve(self, options.first)
      end
    end
  end

  def self.seeds
    Seed::Base.row(self) || raise(RuntimeError, "No row of seeds for #{self}")
  end
end