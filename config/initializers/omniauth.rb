OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  
  #live version
<<<<<<< HEAD
  provider	:facebook,	'1433798430185620',		'552e358e083d5a177766969fbacba8ed'
=======
  # provider	:facebook, '1433798430185620', '552e358e083d5a177766969fbacba8ed'
>>>>>>> stage

  #development
  #provider	:facebook,	'648784961845050',		'18e14a9e34e3ca053332fb53c1a0d305'
  					
end