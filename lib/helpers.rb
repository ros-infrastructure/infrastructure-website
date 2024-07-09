def parse_markdown_link(link_str, format=:link, html_classes="")
  regex_match = /\[(.*)\]\((.*)\)/.match link_str
  case format
  when :link
    "<a class='#{html_classes}' href='#{regex_match[2]}' alt='#{regex_match[1]}'>#{regex_match[1]}</a>"
  when :image
    "<img class='#{html_classes}' src='#{regex_match[2]}' alt='#{regex_match[1]}'>"
  end
end
