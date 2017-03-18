def navigation
  nav =
    if @item.identifier == '/index.md'
      conferences.each_with_object({}) do |conference, memo|
        memo[conference.path] = conference.title
      end
    else
      conference.navigation
    end

  nav.map do |link, text|
    # Awkward reverse of the routing rule in the Rules file.
    normalized =  link[0..-2] + (text == 'Overview' ? '/index.md' : '.md')
    %(<li class="#{@item.identifier == normalized ? 'selected' : ''}"><a href="#{link}">#{text}</a></li>)
  end.join("\n")
end
