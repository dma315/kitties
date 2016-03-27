Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :instagram, ENV['INSTAGRAM_ID'], ENV['INSTAGRAM_SECRET']
  provider :instagram, "bdbcdeae5fe54e32a54f2e0227c0ee38", "35aab5a99805479489083c306182b6f2"
end