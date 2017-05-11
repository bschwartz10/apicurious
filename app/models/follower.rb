class Follower
attr_reader :login, :avatar_url

  def initialize(attrs = {})
    @attrs = attrs
    @login = attrs[:login]
    @avatar_url = attrs[:avatar_url]
  end

  private
    attr_reader :attrs

end
