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
        '/2018-munich/stream/' => 'Live Stream',
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
        '/2019-munich/stream/' => 'Live Stream',
        '/coc/' => 'Code of Conduct',
      },
      Banner.new('munich-banner', 'Qwrt!', 'https://www.flickr.com/photos/qwertworks/9983260225/'),
    ),
    Conference.new(
      'PromCon Online 2020',
      'The Prometheus conference — July 14 - 16 online',
      '/2020-online/',
      {
        '/2020-online/' => 'Overview',
        '/2020-online/register/' => 'Register',
        '/2020-online/schedule/' => 'Schedule',
        '/2020-online/stream/' => 'Live Stream',
        '/coc/' => 'Code of Conduct',
      },
      Banner.new('online-banner', 'Luke Chesser', 'https://unsplash.com/photos/tgrBcf7S_dY'),
    ),
    Conference.new(
      'PromCon Online 2021',
      'The Prometheus conference — May 3 online',
      '/2021-online/',
      {
        '/2021-online/' => 'Overview',
#        '/2021-online/register/' => 'Register',
        '/2021-online/schedule/' => 'Schedule',
#        '/2021-online/submit/' => 'Submit a talk',
        '/coc/' => 'Code of Conduct',
      },
      Banner.new('online-banner', 'Luke Chesser', 'https://unsplash.com/photos/tgrBcf7S_dY'),
    ),
    Conference.new(
      'PromCon NA 2021',
      'The Prometheus conference — October 11 in Los Angeles',
      '/2021-losangeles/',
      {
        '/2021-losangeles/' => 'Overview',
#        '/2021-losangeles/registration/' => 'Registration',
#        '/2021-losangeles/submit/' => 'Submit a talk',
        '/2021-losangeles/diversity/' => 'Diversity',
        '/2021-losangeles/schedule/' => 'Schedule',
#        '/2021-losangeles/scholarship/' => 'Scholarship',
#        '/2021-losangeles/venue/' => 'Venue',
#        '/2021-losangeles/safety/' => 'COVID-19',
#        '/coc/' => 'Code of Conduct',
      },
      Banner.new('losangeles-banner', 'Cameron Venti', 'https://unsplash.com/photos/0YWaDPylkYA'),
    ),
    Conference.new(
      'PromCon EU 2022',
      'The Prometheus conference — November 08 - 09 in Munich',
      '/2022-munich/',
      {
        '/2022-munich/' => 'Overview',
#        '/2022-munich/register/' => 'Register',
        '/2022-munich/diversity/' => 'Diversity',
#        '/2022-munich/submit/' => 'CfP',
        '/2022-munich/schedule/' => 'Schedule',
#        '/2022-munich/sponsor/' => 'Sponsor',
        '/2022-munich/health-and-safety/' => 'Health & Safety',
#        '/2022-munich/stream/' => 'Live Stream',
        '/coc/' => 'Code of Conduct',
      },
      Banner.new('munich-banner', 'Qwrt!', 'https://www.flickr.com/photos/qwertworks/9983260225/'),
    ),
    Conference.new(
      'PromCon EU 2023',
      'The Prometheus conference — September 28 - 29 in Berlin',
      '/2023-berlin/',
      {
        '/2023-berlin/' => 'Overview',
        '/2023-berlin/register/' => 'Register',
        '/2023-berlin/diversity/' => 'Diversity',
        '/2023-berlin/submit/' => 'CfP',
        '/2023-berlin/schedule/' => 'Schedule',
        '/2023-berlin/sponsor/' => 'Sponsor',
        '/2023-berlin/health-and-safety/' => 'Health & Safety',
        # '/2023-berlin/stream/' => 'Live Stream',
        '/coc/' => 'Code of Conduct',
      },
      Banner.new('berlin-banner', 'Céline Lang', 'https://www.flickr.com/photos/line68/10555465713'),
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
