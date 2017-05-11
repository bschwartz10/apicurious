class ReposController < ApplicationController

def show
  @repos = GithubUser.repos(current_user.oauth_token)
end

end
