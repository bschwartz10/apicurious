class GithubUser
attr_reader :avatar_url, :username

def initialize(attrs = {})
  @attrs = attrs
  @avatar_url = attrs[:avatar_url]
  @username = attrs[:login]
end

  def self.find(token)
    user = GithubService.users_by(token)
    new(user)
  end

  private
    attr_reader :attrs

end
