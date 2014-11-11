module BiolaLogs
  module Generators
    class Params < Base
      NON_QUERY_STRING_PARAMS = ['controller', 'action', 'id']
      # We don't need form POST data in the logs since it can be very verbose.
      SUPPORTED_HTTP_METHODS = ['GET']

      def to_hash
        if method_supported? && clean_params.any?
          {params: clean_params.to_json}
        else
          {}
        end
      end

      private

      def clean_params
        @clean_params ||= event.payload[:params].except(*NON_QUERY_STRING_PARAMS)
      end

      def method_supported?
        SUPPORTED_HTTP_METHODS.include?(event.payload[:method])
      end
    end
  end
end
