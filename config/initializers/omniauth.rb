OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  
  
  provider :facebook, '594234663991169', '2dfa0249e72a2577caa0911b549cf342'
  					
end