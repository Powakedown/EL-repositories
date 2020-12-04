class Repository < ApplicationRecord
  validates_presence_of :remote_id

  def self.attributes_to_synchronize
    %w[name description stargazers_count html_url]
  end

  def self.remote
    GithubServices::UserRepository.new.list('edulib-france')
  end

  def starred?
    stargazers_count.positive?
  end

  def self.synchronized
    remote_repos = Repository.remote

    return nil unless remote_repos

    remote_repos.each do |remote_repo|
      repo = Repository.find_or_create_by(remote_id: remote_repo['id'])
      repo.synchronize(remote_repo)
    end

    Repository.all
  end

  def synchronize(remote_repo)
    return if up_to_date?(remote_repo['updated_at'])

    curated_remote_repo = remote_repo.extract! *Repository.attributes_to_synchronize
    update(curated_remote_repo)
  end

  def up_to_date?(date)
    return false if remote_updated_at.nil?

    remote_updated_at >= date
  end
end
