# Resolve namespace conflict between Admin model and Admin controller module
# This tells Rails to eager load the Admin model so it's available before
# the Admin module is defined in controllers
Rails.application.config.to_prepare do
  # Explicitly require the Admin model to avoid autoloading conflicts
  require_dependency 'admin' if Rails.env.development?
end
