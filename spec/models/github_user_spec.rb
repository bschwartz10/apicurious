require 'rails_helper'

describe GithubUser do
  context ".find(token)" do
    it "returns a user that matches the token" do
      token = ENV['github_user_token']
      github_user = GithubUser.find(token)

      expect(github_user.username).to eq("bschwartz10")
    end
  end
end
