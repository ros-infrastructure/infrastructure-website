require "yaml"
require "net/http"

class ReposDataSource < Nanoc::DataSource
  identifier :repos

  def up
    repos_content = YAML::load_file 'content/repos.yml'
    @repos = []

    repos_content['repos'].each do |url|
      repo_name = /^.*\/(.*\/.*)$/.match(url)[1]
      repo_readme_uri = URI("https://raw.githubusercontent.com/#{repo_name}/main/README.md")
      readme_content = Net::HTTP.get_response(repo_readme_uri)
      unless readme_content.code.to_i == 200
        puts "WARNING: #{repo_readme_uri} returned #{readme_content.code}"
        next
      end
      @repos << {id: "/#{repo_name.gsub('/', '-')}.md", name: repo_name, url: url, content: readme_content.body}
    end
  end


  def items
    @repos.map do |repo|
      new_item(
        repo[:content],
        repo,
        repo[:id]
      )
    end
  end
end
