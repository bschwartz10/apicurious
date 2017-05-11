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

  private
    attr_reader :attrs

end
