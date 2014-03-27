class Wish
  include MongoMapper::Document

  belongs_to :user

  timestamps!
end
