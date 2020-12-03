module GithubServices
  class UserRepositories
    def list(user)
      base_url = "https://api.github.com/users/"
      suffix_url = "/repos"

      data = begin
        RestClient.get(base_url + user + suffix_url)
      rescue => e
        e.response.body
      end

      JSON.parse(data)
    end
  end
end
