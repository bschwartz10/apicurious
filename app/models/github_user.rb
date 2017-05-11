class GithubUser
attr_reader :avatar_url, :username, :followers

def initialize(attrs = {})
  @attrs = attrs
  @avatar_url = attrs[:avatar_url]
  @username = attrs[:login]
  @followers = attrs[:followers_url]
end

  def self.find(token)
    user = GithubService.users_by(token)
    new(user)
  end

  def self.starred(token)
    GithubService.starred_by(token)
  end

  def self.followers(token)
    GithubService.followers_by(token).map do |user|
      Follower.new(user)
    end
  end

  def self.following(token)
    GithubService.following_by(token).map do |user|
      Following.new(user)
    end
  end

  def self.push_events(username, token)
    GithubService.new.events_by(username, token).select do |event|
      event[:type] == "PushEvent"
    end
  end

  def self.commits(username, token)
    push_events = GithubUser.push_events(username, token)

    push_events.map do |event|
      event[:payload][:commits].map do|commit|
        Commit.new(commit)
      end
    end
  end

  def self.repos(token)
    GithubService.new.repos_by(token).map do |repo|
      Repo.new(repo)
    end
  end

  private
    attr_reader :attrs

end
