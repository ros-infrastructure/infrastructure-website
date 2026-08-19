include Nanoc::Helpers::Rendering

MARKDOWN_LINK_RE = /!?\[(.*?)\]\((.*?)\)/

def parse_markdown_link(link_str, format=:link, html_classes="", img_base_url="")
  regex_match = MARKDOWN_LINK_RE.match link_str.to_s
  return link_str.to_s if regex_match.nil?

  case format
  when :link
    "<a class='#{html_classes}' href='#{regex_match[2]}'>#{regex_match[1]}</a>"
  when :image
    "<img class='#{html_classes}' src='#{img_base_url}#{regex_match[2]}' alt='#{regex_match[1]}'>"
  when :text
    # Label only, for places where the link would be nested inside another one.
    regex_match[1]
  end
end

# The main navigation, shared by the navbar and the footer.
def nav_items
  [
    ['Projects',      '/projects'],
    ['Team',          '/team'],
    ['Documentation', '/documentation'],
    ['Repositories',  '/repos'],
    ['Dashboard',     'https://osrf.github.io/buildfarm-tools/dashboard/index.html'],
    ['Contribute',    '/contribute'],
  ]
end

# Nav entries are either site-relative paths or absolute URLs to other sites.
def nav_external?(path)
  path.start_with?('http://', 'https://')
end

# Only site-relative entries get the base URL prefix.
def nav_url(path, base_url)
  nav_external?(path) ? path : "#{base_url}#{path}"
end

# True when the given item lives under the section a nav entry points at, so
# that both `/team` and `/team/blast545` highlight the "Team" link.
def nav_active?(item, path)
  identifier = item.identifier.to_s
  identifier == "#{path}/index.html.erb" || identifier.start_with?("#{path}/")
end
