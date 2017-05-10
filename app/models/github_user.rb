class GithubUser

def initialize(attrs = {})
  @attrs = attrs
end

  def self.find(token)
    user = GithubService.users_by(token)
    new(user)
  end

  def username
    attrs[:login]
  end

  private
    attr_reader :attrs

end
