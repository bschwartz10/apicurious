class Repo
attr_reader :name, :html_url

  def initialize(attrs = {})
    @name = attrs[:name]
    @html_url = attrs[:html_url]
  end

end
