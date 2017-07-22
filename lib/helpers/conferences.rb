Banner = Struct.new(:class, :author, :url)

class Conference < Struct.new(:title, :subtitle, :path, :navigation, :banner)
  # banner_class returns the banner class if available.
  def banner_class
    return unless banner

    banner.class
  end

  # banner_copyright returns the HTML code containing the copyright notice.
  def banner_copyright
    return unless banner

    %(Header photo: &copy; <a href="#{banner.url}">#{banner.author}</a>)
  end
end

# conferences returns a list of all available conferences.
def conferences
  @_conferences ||= [
    Conference.new(
      'PromCon 2016',
      'The Prometheus conference — August 25 - 26 in Berlin',
      '/2016-berlin/',
      {
       '/2016-berlin/' => 'Overview',
       '/2016-berlin/schedule/' => 'Schedule',
       '/coc/' => 'Code of Conduct',
      },
      Banner.new('berlin-banner', 'Céline Lang', 'https://www.flickr.com/photos/line68/10555465713'),
    ),
    Conference.new(
      'PromCon 2017',
      'The Prometheus conference — August 17 - 18 in Munich',
      '/2017-munich/',
      {
       '/2017-munich/' => 'Overview',
       '/2017-munich/venue/' => 'Venue',
       '/2017-munich/register/' => 'Register',
       '/2017-munich/schedule/' => 'Schedule',
       '/coc/' => 'Code of Conduct',
      },
      Banner.new('munich-banner', 'Qwrt!', 'https://www.flickr.com/photos/qwertworks/9983260225/'),
    ),
  ]
end

# conference returns the conference object matching the first part of an item's
# identifier. The last conference is returned if no conference matches an item's
# identifier.
def conference(i = item)
  conference = conferences.find { |c| i.identifier.to_s.start_with?(c.path) }
  conference || conferences.last
end
