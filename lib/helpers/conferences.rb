Banner = Struct.new(:class, :author, :url)
Conference = Struct.new(:title, :subtitle, :banner)

# conferences returns a dictionary of all available conferences.
def conferences
  @_conferences ||= {
    '/2016-berlin/' => Conference.new(
      'PromCon 2016',
      'The Prometheus conference — August 25 - 26 in Berlin',
      Banner.new('berlin-banner', 'Céline Lang', 'https://www.flickr.com/photos/line68/10555465713'),
    ),
    '/2017-munich/' => Conference.new(
      'PromCon 2017',
      'The Prometheus conference — August 17 - 18 in Munich',
      Banner.new('munich-banner', 'Qwrt!', 'https://www.flickr.com/photos/qwertworks/9983260225/'),
    ),
  }
end

# conference_for_item returns the conference object matching the first part of
# an items identifier. The last conference is returned if no conference matches
# an item's identifier.
def conference_for_item(item)
  conference = conferences.find { |p, _| item.identifier.to_s.start_with?(p) }
  conference ? conference.last : conferences.values.last
end

# conference_banner_classes returns all banner related CSS classes for a given
# item.
def conference_banner_classes(item)
  return unless item[:conference].banner

  classes = [item[:conference].banner.class]
  classes << 'fadein-banner' if item.identifier =~ '/**/index.md'
  classes.join(' ')
end

# conference_banner_copyright returns the HTML code containing the copyright
# notice.
def conference_banner_copyright(item)
  banner = item[:conference].banner
  return unless banner

  %(Header photo: &copy; <a href="#{banner.url}">#{banner.author}</a>)
end
