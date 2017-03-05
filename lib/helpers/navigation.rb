def navigation
  links =
    case @item.identifier
    when /^\/2017-munich\//, '/coc.md'
      {
       '/2017-munich/' => 'Overview',
       '/2017-munich/register/' => 'Register',
       # '/2017-munich/submit/' => 'Call for Papers',
       # '/2017-munich/sponsor/' => 'Sponsor',
       '/coc/' => 'Code of Conduct',
      }
    when /^\/2016-berlin\//
      {
       '/2016-berlin/' => 'Overview',
       '/2016-berlin/schedule/' => 'Schedule',
       '/coc/' => 'Code of Conduct',
      }
    else
      {
        '/2017-munich/' => '2017 - Munich',
        '/2016-berlin/' => '2016 - Berlin',
      }
    end

  links.map do |link, text|
    # Awkward reverse of the routing rule in the Rules file.
    normalized =  link[0..-2] + (text == 'Overview' ? '/index.md' : '.md')
    %(<li class="#{@item.identifier == normalized ? 'selected' : ''}"><a href="#{link}">#{text}</a></li>)
  end.join("\n")
end
