class DashboardController < ApplicationController

def show
  @githubuser = GithubUser.find(current_user.oauth_token)
  @starred_repos = GithubUser.starred(current_user.oauth_token)
end


end
