module BiolaLogs
  class Railtie < Rails::Railtie
    initializer :biola_logs, before: :lograge do |app|
      config.lograge.enabled = true
      config.lograge.custom_options = Generators.handler
    end
  end
end
