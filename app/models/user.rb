class User
  include MongoMapper::Document

  has_many :wishes

  key :provider,          String
  key :uid,               String
  key :name,              String
  key :oauth_token,       String
  key :oauth_expires_at,  Time

   def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         # user.email = auth['info']['email'] || ""
      end
    end
  end
end
