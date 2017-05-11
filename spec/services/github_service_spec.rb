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
  context ".starred_by(token)" do
      it "returns an array of starred repos" do
        VCR.use_cassette("github_service_starred_by") do
          token = ENV['github_user_token']
          starred_repos = GithubService.starred_by(token)

          expect(starred_repos).to be_an(Array)
          expect(starred_repos.first).to have_key(:name)
          expect(starred_repos.first[:name]).to be_a(String)
        end
      end
    end
  context ".followers_by(token)" do
      it "returns an array of user followers" do
        VCR.use_cassette("github_service_followers_by") do
          token = ENV['github_user_token']
          followers = GithubService.followers_by(token)

          expect(followers).to be_an(Array)
          expect(followers.first).to have_key(:login)
          expect(followers.first[:login]).to be_a(String)
        end
      end
    end
  end
end
