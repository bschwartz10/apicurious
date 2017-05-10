class DashboardController < ApplicationController

def show
  @githubuser = GithubUser.find(current_user.oauth_token)
end


end
