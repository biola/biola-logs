module BiolaLogs
  module Generators
    def self.all
      # Class method to get all classes in the BiolaLogs::Generators module 
      # returns an Array, skipping BiolaLogs::Generators::Base
      # example: [BiolaLogs::Generators::Params, BiolaLogs::Generators::Headers] 
      self.constants.map(&self.method(:const_get)).grep(Class) - [Base]
    end

    def self.handler
      # Class method that returns a hash of key/value pairs for `config.lograge.custom_options`
      # Calls to_hash() on all generators and merges the results into a single hash
      Proc.new do |event|
        self.all.each_with_object({}) do |klass, hash|
          hash.merge! klass.new(event).to_hash
        end
      end
    end
  end
end
