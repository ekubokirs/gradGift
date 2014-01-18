class BlankWish < Wish
  include MongoMapper::Document

  key	:blank_wish,	String,	:required => true

end
