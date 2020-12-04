class  RepositoriesController < ApplicationController
  before_action :set_repository, only: %I[show]

  def index
    @repositories = Repository.synchronized || Repository.all
  end

  def show; end

  private

  def set_repository
    @repository = Repository.find(params[:id])
  end
end
