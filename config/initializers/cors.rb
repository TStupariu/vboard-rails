Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:8080'
    resource '*', headers: :any, methods: [:get, :post, :options, :patch, :delete] , expose: ['uId', 'expiry', 'client', 'access-token']
  end
end