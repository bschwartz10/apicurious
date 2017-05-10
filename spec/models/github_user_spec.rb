require 'rails_helper'

describe GithubUser do
  context ".find(token)" do
    it "returns a user that matches the token" do
      token = ENV['github_user_token']
      stubbed_response = {
        :login => "bschwartz10",
        :avatar_url => "https://avatars3.githubusercontent.com/u/21000661?v=3",
        :name => "Brett Schwartz"
      }
      allow_any_instance_of(GithubService).to receive(:users_by).with(token).and_return(stubbed_response)
      github_user = GithubUser.find(token)

      expect(github_user.username).to eq("bschwartz10")
    end
  end
end
