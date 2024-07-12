#!/usr/bin/env ruby

require "yaml"
require "json"
require "net/http"

# Add a repository link in `repos.yml` file.
# After that, run this script as: `./fetch_repositories.rb`
# A .md file from each repository will be created in `/content/repos` folder

def get_repos
  repos = []
  repos_content = YAML::load_file 'repos.yml'
  repos_content['repos'].each do |url|
    repo_name = /^.*\/(.*\/.*)$/.match(url)[1]
    api_uri = URI("https://api.github.com/repos/#{repo_name}")
    api_response =  Net::HTTP.get_response(api_uri)
    unless api_response.code == "200"
      puts "WARNING: #{api_uri} returned #{api_response.code}"
      next
    end
    repos << JSON.parse(api_response.body)
  end
  repos
end

def write_repos(repos)
  repos.each do |repo|
    repo['name'] = repo['full_name'].gsub('/', '-')
    File.open("content/repos/#{repo['name']}.md", 'w') do |file|
      file.write "---\n" \
      "name: #{repo['name']}\n" \
      "url: #{repo['html_url']}\n" \
      "description: #{repo['description']}\n" \
      "owner: #{repo['owner']['login']}\n" \
      '---'
    end
  end
end

write_repos(get_repos)
