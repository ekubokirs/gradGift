OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider	:facebook, '1433798430185620', '552e358e083d5a177766969fbacba8ed'
  					
end