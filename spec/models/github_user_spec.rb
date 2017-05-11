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
  context ".push_events(username, token)" do
    it "returns an array of push_events belonging to a user" do
      username = 'bschwartz10'
      token = ENV['github_user_token']
      stubbed_response = [
      {
        "id": "5850193415",
        "type": "DeleteEvent",
        "actor": {
          "id": 21000661,
          "login": "bschwartz10",
          "display_login": "bschwartz10",
          "gravatar_id": "",
          "url": "https://api.github.com/users/bschwartz10",
          "avatar_url": "https://avatars.githubusercontent.com/u/21000661?"
        },
        "repo": {
          "id": 90686553,
          "name": "bschwartz10/apicurious",
          "url": "https://api.github.com/repos/bschwartz10/apicurious"
        },
        "payload": {
          "ref": "oauth-authentication",
          "ref_type": "branch",
          "pusher_type": "user"
        },
        "public": true,
        "created_at": "2017-05-11T03:27:36Z"
      },
      {
        "id": "5850193117",
        "type": "DeleteEvent",
        "actor": {
          "id": 21000661,
          "login": "bschwartz10",
          "display_login": "bschwartz10",
          "gravatar_id": "",
          "url": "https://api.github.com/users/bschwartz10",
          "avatar_url": "https://avatars.githubusercontent.com/u/21000661?"
        },
        "repo": {
          "id": 90686553,
          "name": "bschwartz10/apicurious",
          "url": "https://api.github.com/repos/bschwartz10/apicurious"
        },
        "payload": {
          "ref": "basic-info",
          "ref_type": "branch",
          "pusher_type": "user"
        },
        "public": true,
        "created_at": "2017-05-11T03:27:31Z"
      },
      {
        "id": "5850189707",
        "type": "PushEvent",
        "actor": {
          "id": 21000661,
          "login": "bschwartz10",
          "display_login": "bschwartz10",
          "gravatar_id": "",
          "url": "https://api.github.com/users/bschwartz10",
          "avatar_url": "https://avatars.githubusercontent.com/u/21000661?"
        },
        "repo": {
          "id": 90686553,
          "name": "bschwartz10/apicurious",
          "url": "https://api.github.com/repos/bschwartz10/apicurious"
        },
        "payload": {
          "push_id": 1732371354,
          "size": 26,
          "distinct_size": 1,
          "ref": "refs/heads/master",
          "head": "9e0cc0ac06fc94ba88709f57de14d2aaf8bf621f",
          "before": "f82a6de4cbee6bb0ec1b520f4c3d5d24571161c5",
          "commits": [
            {
              "sha": "3ab71cf9248bd858195cf2236cc152d6403b9db3",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create github user poro and githubservice",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/3ab71cf9248bd858195cf2236cc152d6403b9db3"
            },
            {
              "sha": "650755045ff40a6de4eb31917ba99332b7cd4f86",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "redirect logged in user to dashboard show page\n\nusername is showing up in view",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/650755045ff40a6de4eb31917ba99332b7cd4f86"
            },
            {
              "sha": "40ed9e6a9f8ce658e14b171bd4e2b496f8c7cf12",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "import bootstrap",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/40ed9e6a9f8ce658e14b171bd4e2b496f8c7cf12"
            },
            {
              "sha": "f71abe3fce4e72815030413e1b89658fd6ad5eb7",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add vcr and username and pro pic tests",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/f71abe3fce4e72815030413e1b89658fd6ad5eb7"
            },
            {
              "sha": "a672b554605d03c1eb50e7cc3f47d5db07a6a7d1",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add starred_repos instance variable to controller",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/a672b554605d03c1eb50e7cc3f47d5db07a6a7d1"
            },
            {
              "sha": "524c2d51af81affdede6f73691e3cfefea159262",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create followers controller\n\ncreate show action to house a followers instance variable which is an\narray of hashes of the current users followers",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/524c2d51af81affdede6f73691e3cfefea159262"
            },
            {
              "sha": "706931cce065fb2eebade0fff802f03893464a6e",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create follower class\n\nfollower class has login and avatar_url methods",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/706931cce065fb2eebade0fff802f03893464a6e"
            },
            {
              "sha": "bd40ff4a13e66e3172cb37fec5e6d5cd317293c1",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add starred/followers method to githubuser model\n\nstarred method returns an array of starred repos\nfollowers method return an array of the current users followers",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/bd40ff4a13e66e3172cb37fec5e6d5cd317293c1"
            },
            {
              "sha": "1d7f2727c6a871b7b3219781019659c0899e80a8",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create starred_by and followers_by methods\n\nstarred_by method hits the starred endpoint and returns and array of\nrepos\nfollowers_by method hits the followers endpoint and returns an array of\nfollowers",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/1d7f2727c6a871b7b3219781019659c0899e80a8"
            },
            {
              "sha": "41f02328558bb12912b4d926a15a288bedfa352b",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add starred repos count and followers link to view",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/41f02328558bb12912b4d926a15a288bedfa352b"
            },
            {
              "sha": "3175b652a55d485441d7cfc41937148dfb6ecec5",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "iterate through followers instance variable and display attributes",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/3175b652a55d485441d7cfc41937148dfb6ecec5"
            },
            {
              "sha": "f6ccbc03481117b28edcb71431063754df75f267",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add /followers route",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/f6ccbc03481117b28edcb71431063754df75f267"
            },
            {
              "sha": "3f10228846676ba1a9ad1bca60c13cc215f529ad",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add starred repos and follower tests",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/3f10228846676ba1a9ad1bca60c13cc215f529ad"
            },
            {
              "sha": "5d25c20031948f9dfda3309b319886b14c3c7d88",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "vcr_cassettes",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/5d25c20031948f9dfda3309b319886b14c3c7d88"
            },
            {
              "sha": "a6231e5adfb685c46141a6e223d1614ab82897ae",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "vcr_cassettes",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/a6231e5adfb685c46141a6e223d1614ab82897ae"
            },
            {
              "sha": "2a1a0939697a0b3b9efff083a1f9631717491ffb",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "var cassettes",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/2a1a0939697a0b3b9efff083a1f9631717491ffb"
            },
            {
              "sha": "a236ce92068e84c6928c8e8cbcb8251173ca62f6",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add following controller with show action\n\ncreate @following instance variable in show method",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/a236ce92068e84c6928c8e8cbcb8251173ca62f6"
            },
            {
              "sha": "16779b18e5b3b6689526eb09fe9aa2bc9f3579aa",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create following class",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/16779b18e5b3b6689526eb09fe9aa2bc9f3579aa"
            },
            {
              "sha": "4fff030d72469ee017f7a2cc8a109c29cc746b08",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create following method to create following instances",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/4fff030d72469ee017f7a2cc8a109c29cc746b08"
            },
            {
              "sha": "e2584c4567003eb9ff296cd4846feaf6466586fb",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create following_by method to reach following endpoint",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/e2584c4567003eb9ff296cd4846feaf6466586fb"
            }
          ]
        },"public": true,
        "created_at": "2017-05-11T03:26:25Z"
      }]
      allow_any_instance_of(GithubService).to receive(:events_by).with(username, token).and_return(stubbed_response)
      push_events = GithubUser.push_events(username, token)
      expect(push_events.first[:id]).to eq("5850189707")
    end
  end
  context ".commits(push_events)" do
    it "creates commit objects belonging to a user" do
      username = 'bschwartz10'
      token = ENV['github_user_token']
      stubbed_response = [
      {
        "id": "5850193415",
        "type": "DeleteEvent",
        "actor": {
          "id": 21000661,
          "login": "bschwartz10",
          "display_login": "bschwartz10",
          "gravatar_id": "",
          "url": "https://api.github.com/users/bschwartz10",
          "avatar_url": "https://avatars.githubusercontent.com/u/21000661?"
        },
        "repo": {
          "id": 90686553,
          "name": "bschwartz10/apicurious",
          "url": "https://api.github.com/repos/bschwartz10/apicurious"
        },
        "payload": {
          "ref": "oauth-authentication",
          "ref_type": "branch",
          "pusher_type": "user"
        },
        "public": true,
        "created_at": "2017-05-11T03:27:36Z"
      },
      {
        "id": "5850193117",
        "type": "DeleteEvent",
        "actor": {
          "id": 21000661,
          "login": "bschwartz10",
          "display_login": "bschwartz10",
          "gravatar_id": "",
          "url": "https://api.github.com/users/bschwartz10",
          "avatar_url": "https://avatars.githubusercontent.com/u/21000661?"
        },
        "repo": {
          "id": 90686553,
          "name": "bschwartz10/apicurious",
          "url": "https://api.github.com/repos/bschwartz10/apicurious"
        },
        "payload": {
          "ref": "basic-info",
          "ref_type": "branch",
          "pusher_type": "user"
        },
        "public": true,
        "created_at": "2017-05-11T03:27:31Z"
      },
      {
        "id": "5850189707",
        "type": "PushEvent",
        "actor": {
          "id": 21000661,
          "login": "bschwartz10",
          "display_login": "bschwartz10",
          "gravatar_id": "",
          "url": "https://api.github.com/users/bschwartz10",
          "avatar_url": "https://avatars.githubusercontent.com/u/21000661?"
        },
        "repo": {
          "id": 90686553,
          "name": "bschwartz10/apicurious",
          "url": "https://api.github.com/repos/bschwartz10/apicurious"
        },
        "payload": {
          "push_id": 1732371354,
          "size": 26,
          "distinct_size": 1,
          "ref": "refs/heads/master",
          "head": "9e0cc0ac06fc94ba88709f57de14d2aaf8bf621f",
          "before": "f82a6de4cbee6bb0ec1b520f4c3d5d24571161c5",
          "commits": [
            {
              "sha": "3ab71cf9248bd858195cf2236cc152d6403b9db3",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create github user poro and githubservice",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/3ab71cf9248bd858195cf2236cc152d6403b9db3"
            },
            {
              "sha": "650755045ff40a6de4eb31917ba99332b7cd4f86",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "redirect logged in user to dashboard show page\n\nusername is showing up in view",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/650755045ff40a6de4eb31917ba99332b7cd4f86"
            },
            {
              "sha": "40ed9e6a9f8ce658e14b171bd4e2b496f8c7cf12",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "import bootstrap",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/40ed9e6a9f8ce658e14b171bd4e2b496f8c7cf12"
            },
            {
              "sha": "f71abe3fce4e72815030413e1b89658fd6ad5eb7",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add vcr and username and pro pic tests",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/f71abe3fce4e72815030413e1b89658fd6ad5eb7"
            },
            {
              "sha": "a672b554605d03c1eb50e7cc3f47d5db07a6a7d1",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add starred_repos instance variable to controller",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/a672b554605d03c1eb50e7cc3f47d5db07a6a7d1"
            },
            {
              "sha": "524c2d51af81affdede6f73691e3cfefea159262",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create followers controller\n\ncreate show action to house a followers instance variable which is an\narray of hashes of the current users followers",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/524c2d51af81affdede6f73691e3cfefea159262"
            },
            {
              "sha": "706931cce065fb2eebade0fff802f03893464a6e",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create follower class\n\nfollower class has login and avatar_url methods",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/706931cce065fb2eebade0fff802f03893464a6e"
            },
            {
              "sha": "bd40ff4a13e66e3172cb37fec5e6d5cd317293c1",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add starred/followers method to githubuser model\n\nstarred method returns an array of starred repos\nfollowers method return an array of the current users followers",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/bd40ff4a13e66e3172cb37fec5e6d5cd317293c1"
            },
            {
              "sha": "1d7f2727c6a871b7b3219781019659c0899e80a8",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create starred_by and followers_by methods\n\nstarred_by method hits the starred endpoint and returns and array of\nrepos\nfollowers_by method hits the followers endpoint and returns an array of\nfollowers",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/1d7f2727c6a871b7b3219781019659c0899e80a8"
            },
            {
              "sha": "41f02328558bb12912b4d926a15a288bedfa352b",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add starred repos count and followers link to view",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/41f02328558bb12912b4d926a15a288bedfa352b"
            },
            {
              "sha": "3175b652a55d485441d7cfc41937148dfb6ecec5",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "iterate through followers instance variable and display attributes",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/3175b652a55d485441d7cfc41937148dfb6ecec5"
            },
            {
              "sha": "f6ccbc03481117b28edcb71431063754df75f267",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add /followers route",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/f6ccbc03481117b28edcb71431063754df75f267"
            },
            {
              "sha": "3f10228846676ba1a9ad1bca60c13cc215f529ad",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add starred repos and follower tests",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/3f10228846676ba1a9ad1bca60c13cc215f529ad"
            },
            {
              "sha": "5d25c20031948f9dfda3309b319886b14c3c7d88",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "vcr_cassettes",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/5d25c20031948f9dfda3309b319886b14c3c7d88"
            },
            {
              "sha": "a6231e5adfb685c46141a6e223d1614ab82897ae",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "vcr_cassettes",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/a6231e5adfb685c46141a6e223d1614ab82897ae"
            },
            {
              "sha": "2a1a0939697a0b3b9efff083a1f9631717491ffb",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "var cassettes",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/2a1a0939697a0b3b9efff083a1f9631717491ffb"
            },
            {
              "sha": "a236ce92068e84c6928c8e8cbcb8251173ca62f6",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "add following controller with show action\n\ncreate @following instance variable in show method",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/a236ce92068e84c6928c8e8cbcb8251173ca62f6"
            },
            {
              "sha": "16779b18e5b3b6689526eb09fe9aa2bc9f3579aa",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create following class",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/16779b18e5b3b6689526eb09fe9aa2bc9f3579aa"
            },
            {
              "sha": "4fff030d72469ee017f7a2cc8a109c29cc746b08",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create following method to create following instances",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/4fff030d72469ee017f7a2cc8a109c29cc746b08"
            },
            {
              "sha": "e2584c4567003eb9ff296cd4846feaf6466586fb",
              "author": {
                "email": "bschwartz92@gmail.com",
                "name": "bschwartz10"
              },
              "message": "create following_by method to reach following endpoint",
              "distinct": false,
              "url": "https://api.github.com/repos/bschwartz10/apicurious/commits/e2584c4567003eb9ff296cd4846feaf6466586fb"
            }
          ]
        },"public": true,
        "created_at": "2017-05-11T03:26:25Z"
      }]
      allow_any_instance_of(GithubService).to receive(:events_by).with(username, token).and_return(stubbed_response)
      commits = GithubUser.commits(username, token)
      expect(commits.first.first.sha).to eq("3ab71cf9248bd858195cf2236cc152d6403b9db3")
    end
  end
end
