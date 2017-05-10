class DashboardController < ApplicationController

def show
  @username = GithubUser.find(current_user.oauth_token).username
end


end
