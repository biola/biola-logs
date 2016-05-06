module BiolaLogs
  module Generators
    class Headers < Base

      def to_hash
        if method_supported?
          h = {}
          h[:session_id] = session_id if session_id
          h[:host] = host if host
          h[:request_id] = uuid if uuid
          h
        else
          {}
        end
      end

      private

      def session_id
        event.payload[:session_id] #requires adding :session_id to payload
      end

      def uuid
        event.payload[:uuid] #requires adding :uuid to payload
      end

      def host
        event.payload[:host] #requires adding :host to payload
      end

      def method_supported?
        # SUPPORTED_HTTP_METHODS.include?(event.payload[:method])
        true
      end
    end
  end
end
