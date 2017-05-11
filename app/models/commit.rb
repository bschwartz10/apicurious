class Commit
attr_reader :sha, :email, :name

def initialize(attrs = {})
  @sha = attrs[:sha]
  @email = attrs[:author][:email]
  @name = attrs[:author][:name]
end


end
