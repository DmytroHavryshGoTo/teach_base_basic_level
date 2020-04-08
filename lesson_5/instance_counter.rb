# frozen_string_literal: true

# Module for counting instances of a class
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # Methods for Class
  module ClassMethods
    attr_accessor :instances
  end

  # Methods for Instance
  module InstanceMethods
    protected

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end
