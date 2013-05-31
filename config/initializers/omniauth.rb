Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV['Zzmqa2ER1aaB9bbDfAm4WQ'], ENV['ga1aF4wyEXIjyg6DupeTKhieyUEa4MmpkcO8aKsPBY']
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], scope: "email, publish_stream"
end
