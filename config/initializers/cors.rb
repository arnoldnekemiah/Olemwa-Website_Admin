# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # Allow public API access (no credentials needed)
  allow do
    origins 'localhost:3000', 'localhost:4000', '127.0.0.1:3000', '127.0.0.1:4000',
            'http://localhost:3000', 'http://localhost:4000',
            'http://127.0.0.1:3000', 'http://127.0.0.1:4000',
            /\Ahttp:\/\/localhost:\d+\z/
    
    resource '/api/*',
      headers: :any,
      methods: [:get, :options, :head],
      credentials: false
  end
  
  # Allow admin panel access with credentials
  allow do
    origins 'localhost:3000', 'localhost:4000', '127.0.0.1:3000', '127.0.0.1:4000',
            'http://localhost:3000', 'http://localhost:4000',
            'http://127.0.0.1:3000', 'http://127.0.0.1:4000',
            /\Ahttp:\/\/localhost:\d+\z/
    
    resource '/admin_panel/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
  
  # For production - update with your actual domains
  allow do
    origins ENV['FRONTEND_URL'] || 'http://localhost:4000'
    
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
