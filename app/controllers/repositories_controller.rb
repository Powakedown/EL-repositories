class  RepositoriesController < ApplicationController
  def index
    @repositories = Repository.synchronized || Repository.all
  end
end
