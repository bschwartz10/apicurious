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
  context ".starred(token)" do
    it "returns a starred repos array" do
      token = ENV['github_user_token']
      stubbed_response = [{
        "id": 90686553,
        "name": "apicurious",
        "full_name": "bschwartz10/apicurious",
        "owner": {
          "login": "bschwartz10",
          "id": 21000661,
          "avatar_url": "https://avatars3.githubusercontent.com/u/21000661?v=3",
          "gravatar_id": "",
          "url": "https://api.github.com/users/bschwartz10",
          "html_url": "https://github.com/bschwartz10",
          "followers_url": "https://api.github.com/users/bschwartz10/followers",
          "following_url": "https://api.github.com/users/bschwartz10/following{/other_user}",
          "gists_url": "https://api.github.com/users/bschwartz10/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/bschwartz10/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/bschwartz10/subscriptions",
          "organizations_url": "https://api.github.com/users/bschwartz10/orgs",
          "repos_url": "https://api.github.com/users/bschwartz10/repos",
          "events_url": "https://api.github.com/users/bschwartz10/events{/privacy}",
          "received_events_url": "https://api.github.com/users/bschwartz10/received_events",
          "type": "User",
          "site_admin": false
          },
        }]
      allow_any_instance_of(GithubService).to receive(:starred_by).with(token).and_return(stubbed_response)
      starred_repo = GithubUser.starred(token).first

      expect(starred_repo[:name]).to eq("apicurious")
    end
  end
  context ".followers(token)" do
    it "returns an array of followers users" do
      token = ENV['github_user_token']
      stubbed_response = [
        {
          "login": "jk1dd",
          "id": 20495477,
          "avatar_url": "https://avatars2.githubusercontent.com/u/20495477?v=3",
          "gravatar_id": "",
          "url": "https://api.github.com/users/jk1dd",
          "html_url": "https://github.com/jk1dd",
          "followers_url": "https://api.github.com/users/jk1dd/followers",
          "following_url": "https://api.github.com/users/jk1dd/following{/other_user}",
          "gists_url": "https://api.github.com/users/jk1dd/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/jk1dd/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/jk1dd/subscriptions",
          "organizations_url": "https://api.github.com/users/jk1dd/orgs",
          "repos_url": "https://api.github.com/users/jk1dd/repos",
          "events_url": "https://api.github.com/users/jk1dd/events{/privacy}",
          "received_events_url": "https://api.github.com/users/jk1dd/received_events",
          "type": "User",
          "site_admin": false
        },
        {
          "login": "NicholasJacques",
          "id": 20036943,
          "avatar_url": "https://avatars3.githubusercontent.com/u/20036943?v=3",
          "gravatar_id": "",
          "url": "https://api.github.com/users/NicholasJacques",
          "html_url": "https://github.com/NicholasJacques",
          "followers_url": "https://api.github.com/users/NicholasJacques/followers",
          "following_url": "https://api.github.com/users/NicholasJacques/following{/other_user}",
          "gists_url": "https://api.github.com/users/NicholasJacques/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/NicholasJacques/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/NicholasJacques/subscriptions",
          "organizations_url": "https://api.github.com/users/NicholasJacques/orgs",
          "repos_url": "https://api.github.com/users/NicholasJacques/repos",
          "events_url": "https://api.github.com/users/NicholasJacques/events{/privacy}",
          "received_events_url": "https://api.github.com/users/NicholasJacques/received_events",
          "type": "User",
          "site_admin": false
          }
        ]
      allow_any_instance_of(GithubService).to receive(:followers_by).with(token).and_return(stubbed_response)
      johnathon = GithubUser.followers(token).first

      expect(johnathon.login).to eq("jk1dd")
    end
  end
  context ".followers(token)" do
    it "returns an array of followers users" do
      token = ENV['github_user_token']
      stubbed_response = [
        {
          "login": "VictoriaVasys",
          "id": 10079657,
          "avatar_url": "https://avatars3.githubusercontent.com/u/10079657?v=3",
          "gravatar_id": "",
          "url": "https://api.github.com/users/VictoriaVasys",
          "html_url": "https://github.com/VictoriaVasys",
          "followers_url": "https://api.github.com/users/VictoriaVasys/followers",
          "following_url": "https://api.github.com/users/VictoriaVasys/following{/other_user}",
          "gists_url": "https://api.github.com/users/VictoriaVasys/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/VictoriaVasys/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/VictoriaVasys/subscriptions",
          "organizations_url": "https://api.github.com/users/VictoriaVasys/orgs",
          "repos_url": "https://api.github.com/users/VictoriaVasys/repos",
          "events_url": "https://api.github.com/users/VictoriaVasys/events{/privacy}",
          "received_events_url": "https://api.github.com/users/VictoriaVasys/received_events",
          "type": "User",
          "site_admin": false
        },
        {
          "login": "stovermc",
          "id": 15877604,
          "avatar_url": "https://avatars0.githubusercontent.com/u/15877604?v=3",
          "gravatar_id": "",
          "url": "https://api.github.com/users/stovermc",
          "html_url": "https://github.com/stovermc",
          "followers_url": "https://api.github.com/users/stovermc/followers",
          "following_url": "https://api.github.com/users/stovermc/following{/other_user}",
          "gists_url": "https://api.github.com/users/stovermc/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/stovermc/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/stovermc/subscriptions",
          "organizations_url": "https://api.github.com/users/stovermc/orgs",
          "repos_url": "https://api.github.com/users/stovermc/repos",
          "events_url": "https://api.github.com/users/stovermc/events{/privacy}",
          "received_events_url": "https://api.github.com/users/stovermc/received_events",
          "type": "User",
          "site_admin": false
        },
        {
          "login": "NicholasJacques",
          "id": 20036943,
          "avatar_url": "https://avatars3.githubusercontent.com/u/20036943?v=3",
          "gravatar_id": "",
          "url": "https://api.github.com/users/NicholasJacques",
          "html_url": "https://github.com/NicholasJacques",
          "followers_url": "https://api.github.com/users/NicholasJacques/followers",
          "following_url": "https://api.github.com/users/NicholasJacques/following{/other_user}",
          "gists_url": "https://api.github.com/users/NicholasJacques/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/NicholasJacques/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/NicholasJacques/subscriptions",
          "organizations_url": "https://api.github.com/users/NicholasJacques/orgs",
          "repos_url": "https://api.github.com/users/NicholasJacques/repos",
          "events_url": "https://api.github.com/users/NicholasJacques/events{/privacy}",
          "received_events_url": "https://api.github.com/users/NicholasJacques/received_events",
          "type": "User",
          "site_admin": false
          }
        ]
      allow_any_instance_of(GithubService).to receive(:following_by).with(token).and_return(stubbed_response)
      victoria = GithubUser.following(token).first

      expect(victoria.login).to eq("VictoriaVasys")
    end
  end
end
