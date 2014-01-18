class SassyWish < Wish 
  include MongoMapper::Document

  key	:nickname,				String, 	:required => true
  key	:time,						String, 	:required => true
  key :relationship,		String, 	:required => true
  key	:embarrassing,		String, 	:required => true
  key	:good_advice,			String, 	:required => true
  key	:bad_things,			String, 	:required => true
  key	:luck,						String, 	:required => true
  key	:closing,					String, 	:required => true
  key	:friend,					String, 	:required => true
  key	:ps,							String, 	:required => true
  
end
