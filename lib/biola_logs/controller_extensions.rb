# Include this module in your application controller to get the additional
# data into the log
#
# class ApplicationController < ActionController::Base
#   include BiolaLogs::ControllerExtensions if defined?(BiolaLogs::ControllerExtensions)
# end
#
module BiolaLogs
  module ControllerExtensions

    protected

    # Custom attributes for lograge logging
    def append_info_to_payload(payload)
      super
      payload[:session_id] = request.session_options[:id]
      payload[:uuid] = request.uuid
      payload[:host] = request.host
    end
  end
end
