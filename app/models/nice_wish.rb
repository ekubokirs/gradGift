class NiceWish < Wish 
  include MongoMapper::Document

	key	:nickname,	String, :required =>	true
  key	:time,			String,	:required =>	true
  key	:nice_one,	String,	:required =>	true
  key	:advice,		String, :required =>	true
  key :thought,		String, :required =>	true
  key	:hope,			String,	:required =>	true
  key	:closing,		String, :required => true
  key	:friend,		String, :required => true
  key	:ps,				String, :required => true

end
