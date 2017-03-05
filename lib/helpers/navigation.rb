def navigation
  links =
    case @item.identifier
    when /^\/2016-berlin\//, '/coc.md'
      {
       '/2016-berlin/' => 'Overview',
       '/2016-berlin/schedule/' => 'Schedule',
       '/coc/' => 'Code of Conduct',
      }
    else
      {
        '/2016-berlin/' => '2016 - Berlin',
      }
    end

  links.map do |link, text|
    # Awkward reverse of the routing rule in the Rules file.
    normalized =  link[0..-2] + (text == 'Overview' ? '/index.md' : '.md')
    %(<li class="#{@item.identifier == normalized ? 'selected' : ''}"><a href="#{link}">#{text}</a></li>)
  end.join("\n")
end
