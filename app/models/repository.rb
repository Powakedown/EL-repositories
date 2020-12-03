class Repository < ApplicationRecord
  validates_presence_of :name, :description, :stars, :url

  def self.synchronized
    remote_repos = GithubServices::UserRepository.new.list('edulib-france')

    return nil unless remote_repos

    remote_repos.each do |repo|
      Repository.create(
        name: repo[:name],
        description: repo[:description],
        stars: repo[:stargazers_count],
        url: repo[:html_url]
      )
    end
  end

end
