require 'csv'

module ActiveCSV
  class Base
    def initialize(attributes = nil)
      @attributes = attributes
    end

    def method_missing(method_name)
      @attributes[method_name.to_s] || super
    end
  end
end