class FollowersController < ApplicationController

def show
  @followers = GithubUser.followers(current_user.oauth_token)
end

end
