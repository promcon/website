#!/usr/bin/env ruby
# encoding: utf-8

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
        '/2017-munich/schedule/' => 'Schedule',
        '/coc/' => 'Code of Conduct',
      },
      Banner.new('munich-banner', 'Qwrt!', 'https://www.flickr.com/photos/qwertworks/9983260225/'),
    ),
    Conference.new(
      'PromCon 2018',
      'The Prometheus conference — August 09 - 10 in Munich',
      '/2018-munich/',
      {
        '/2018-munich/' => 'Overview',
#       '/2018-munich/register/' => 'Register',
#       '/2018-munich/diversity/' => 'Diversity',
        '/2018-munich/schedule/' => 'Schedule',
#       '/2018-munich/sponsor/' => 'Sponsor',
        '/2018-munich/stream' => 'Live Stream',
        '/coc/' => 'Code of Conduct',
      },
      Banner.new('munich-banner', 'Qwrt!', 'https://www.flickr.com/photos/qwertworks/9983260225/'),
    ),
    Conference.new(
      'PromCon EU 2019',
      'The Prometheus conference — November 07 - 08 in Munich',
      '/2019-munich/',
      {
        '/2019-munich/' => 'Overview',
#       '/2019-munich/register/' => 'Register',
#       '/2019-munich/diversity/' => 'Diversity',
#       '/2019-munich/submit/' => 'CfP',
        '/2019-munich/schedule/' => 'Schedule',
#       '/2019-munich/sponsor/' => 'Sponsor',
        '/2019-munich/stream' => 'Live Stream',
        '/coc/' => 'Code of Conduct',
      },
      Banner.new('munich-banner', 'Qwrt!', 'https://www.flickr.com/photos/qwertworks/9983260225/'),
    ),
    Conference.new(
      'PromCon NA 2020',
      'The Prometheus conference — July 16 - 17 in Vancouver',
      '/2020-vancouver/',
      {
        '/2020-vancouver/' => 'Overview',
#       '/2020-vancouver/register/' => 'Register',
#       '/2020-vancouver/diversity/' => 'Diversity',
        '/2020-vancouver/covid-19/' => 'COVID-19 Notice',
        '/2020-vancouver/submit/' => 'Submit Talk',
#       '/2020-vancouver/schedule/' => 'Schedule',
        '/2020-vancouver/sponsor/' => 'Sponsor',
#       '/2020-vancouver/stream' => 'Live Stream',
        '/coc/' => 'Code of Conduct',
      },
      Banner.new('vancouver-banner', 'Mike Benna', 'https://unsplash.com/photos/WHHY-iBp3aI'),
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
