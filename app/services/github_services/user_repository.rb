module GithubServices
  class UserRepository
    def list(user)
      base_url = "https://api.github.com/users/"
      suffix_url = "/repos"

      data = begin
        RestClient.get(base_url + user + suffix_url)
      rescue
        return nil
      end

      repo_json = JSON.parse(data)
    end
  end
end
