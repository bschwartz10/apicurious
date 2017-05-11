class GithubService
attr_reader :token

  def initialize
    @_conn = Faraday.new(:url => "https://api.github.com")
  end

  def users_by(token)
    response = conn.get("/user", {access_token: token})

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.users_by(token)
    service = GithubService.new
    service.users_by(token)
  end

  def starred_by(token)
    response = conn.get("/user/starred", {access_token: token})
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.starred_by(token)
    service = GithubService.new
    service.starred_by(token)
  end

  def self.followers_by(token)
    service = GithubService.new
    service.followers_by(token)
  end

  def followers_by(token)
    response = conn.get("/user/followers", {access_token: token})

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.following_by(token)
    service = GithubService.new
    service.following_by(token)
  end

  def following_by(token)
    response = conn.get("/user/following", {access_token: token})

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.events_by(username, token)
    service = GithubService.new
    service.events_by(token)
  end

  def events_by(username, token)
    response = conn.get("/users/#{username}/events", {access_token: token})
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def conn
      @_conn
    end

end
