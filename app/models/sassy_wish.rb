class SassyWish < Wish 
  include MongoMapper::Document

  key	:nickname,				String	
  key	:time,						String	
  key :relationship,		String	
  key	:embarrassing,		String	
  key	:good_advice,			String	
  key	:bad_things,			String	
  key	:luck,						String 	
  key	:closing,					String	
  key	:friend,					String
  key	:ps,							String

  validates_presence_of :nickname, :time, :relationship, :embarrassing, :good_advice, :bad_things, :luck, :closing, :friend, :ps
  
end
