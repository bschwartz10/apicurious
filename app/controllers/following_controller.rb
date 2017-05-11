class FollowingController < ApplicationController

  def show
    @following = GithubUser.following(current_user.oauth_token)
  end

end
