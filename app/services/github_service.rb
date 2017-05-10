class GithubService

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

  private
    def conn
      @_conn
    end

end
