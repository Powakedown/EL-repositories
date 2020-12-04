class RepositoryDecorator
  attr_reader :repository, :view_context

  delegate :id, to: :repository

  def initialize(user, view_context)
    @repository, @view_context = user, view_context
  end

  def css_id
    "repository-#{id}"
  end
end
