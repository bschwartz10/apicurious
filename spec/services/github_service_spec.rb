require 'rails_helper'

describe GithubService do
  context ".users_by(token)" do
      it "returns a user" do
        VCR.use_cassette("github_service_users_by") do
          token = ENV['github_user_token']
          user = GithubService.users_by(token)
          expect(user).to be_an(Hash)
          expect(user).to have_key(:login)
          expect(user).to have_key(:avatar_url)
          expect(user[:login]).to be_a(String)
          expect(user[:avatar_url]).to be_a(String)
      end
    end
  end
end
