class User < ActiveRecord::Base

def self.from_omniauth(auth_info)
  where(uid: auth_info[:uid]).first_or_create do |new_user|
    new_user.uid = auth_info.uid
    new_user.username = auth_info.extra.raw_info.login
    new_user.image_url = auth_info.info.image
    new_user.token = auth_info.credentials.token
    new_user.followers_url = auth_info.extra.raw_info.followers_url
    new_user.following_url = auth_info.extra.raw_info.following_url
    new_user.starred_url = auth_info.extra.raw_info.starred_url
  end
end


end
