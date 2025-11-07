def parse_markdown_link(link_str, format=:link, html_classes="", img_base_url="")
  regex_match = /\[(.*)\]\((.*)\)/.match link_str
  case format
  when :link
    "<a class='#{html_classes}' href='#{regex_match[2]}' alt='#{regex_match[1]}'>#{regex_match[1]}</a>"
  when :image
    "<img class='#{html_classes}' src='#{img_base_url}#{regex_match[2]}' alt='#{regex_match[1]}'>"
  end
end
