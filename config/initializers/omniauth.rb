OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['CALENDHER_FACEBOOK_APP_ID'], ENV['CALENDHER_FACEBOOK_SECRET']
end