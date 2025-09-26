require 'rack-timeout'

# Define o timeout máximo para requisições (em segundos)
if Rack::Timeout.respond_to?(:service_timeout=)
  Rack::Timeout.service_timeout = 60
elsif Rack::Timeout.respond_to?(:timeout=)
  Rack::Timeout.timeout = 60
end

# Reduce noise by filtering state=ready and state=completed which are logged at INFO level
Rails.application.config.after_initialize do
  Rack::Timeout::Logger.level = Logger::ERROR
end
