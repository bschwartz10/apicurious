class CommitsController < ApplicationController

  def show
    @commits = GithubUser.commits(current_user.username, current_user.oauth_token)
  end
end
