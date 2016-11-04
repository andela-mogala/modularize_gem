require "modularize/version"

module Modularize
  def self.create(path, root = Object)
    path.split('::').each do |name|
      root = create_module(name, root)
    end
  end

  private

  def self.create_module(name, root)
    new_module = if root.const_defined?(name)
               root.const_get(name)
             else
               nil
             end
    unless new_module
      new_module = Module.new
      root.const_set name, new_module
    end
    new_module
  end
end
