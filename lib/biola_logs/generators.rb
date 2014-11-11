module BiolaLogs
  module Generators
    def self.all
      self.constants.map(&self.method(:const_get)).grep(Class) - [Base]
    end

    def self.handler
      Proc.new do |event|
        self.all.each_with_object({}) do |klass, hash|
          hash.merge! klass.new(event).to_hash
        end
      end
    end
  end
end
