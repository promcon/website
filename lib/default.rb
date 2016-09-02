# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Rendering
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging

require 'nanoc/cachebuster'
include Nanoc::Helpers::CacheBusting

def navigation
  links =
    case @item.identifier
    when /^\/2016-berlin/
      {
       '/2016-berlin/' => 'Overview',
       '/2016-berlin/venue/' => 'Venue',
       '/2016-berlin/schedule/' => 'Schedule',
       '/2016-berlin/coc/' => 'Code of Conduct',
      }
    else
      {
        '/2016-berlin/' => '2016 - Berlin',
      }
    end

  links.map do |link, text|
    %(<li class="#{@item.identifier == link ? 'selected' : ''}"><a href="#{link}">#{text}</a></li>)
  end.join("\n")
end
