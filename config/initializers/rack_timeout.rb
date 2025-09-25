require 'rack-timeout'

# Define o timeout máximo para requisições (em segundos)
Rack::Timeout.timeout = 60  # aumenta de 15s para 60s

# Reduce noise by filtering state=ready and state=completed which are logged at INFO level
Rails.application.config.after_initialize do
  Rack::Timeout::Logger.level = Logger::ERROR
end
