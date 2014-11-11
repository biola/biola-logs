module BiolaLogs
  module Generators
    class Base
      attr_reader :event

      # event should quack like ActiveSupport::Notifications::Event
      def initialize(event)
        @event = event
      end

      def to_hash
        raise ArgumentError, 'This method should be overridden in a subclass'
      end
    end
  end
end
