#!/usr/bin/perl

use warnings;
use strict;

use DateTime;
use DateTime::Duration;

sub process {
    my $content;
    {
        local $/;
        $content = <>;
    }

    my @events;
    my $id = 0;
    my $day = 0;
    while($content =~ m#<tr class="(.*?)">(.*?)</tr>#sg) {
        my $type = $1;
        my $slotcontent = $2;
        if ($type eq "day") {
            $day = $1 - 1 if ($slotcontent =~ /Day (\d+)/);
            $events[$day] = [];
            next;
        }
        my ($time, $title, $speakers) = (
            $slotcontent =~ m#<td>\s*(.*?)\s*</td>#sg);
        my ($talklink, $desc, $links);
        if ($title =~ m#^\s*(.*)<a href="(.*)">\s*(\S.*\S)\s*</a>(.*?)\s*$#s) {
            $title = "$1$3$4";
            $talklink = $2;
            my $linkdesc = $3;
            $title =~ s/\s+/ /g;
            if ($talklink) {
                my $talkfname = "content/$talklink.md";
                if (-f $talkfname) {
                    ($desc, $links) = process_talk($talkfname);
                } else {
                    $links = [[$talklink, $linkdesc]];
                    $talklink = undef;
                }
            }
        }
        $title =~ s#<br/?>##g;
        my @speakers;
        while ($speakers =~ s#
            <a\ href="(.*?)">(.*?)</a>\s*
            (?:
                <br>\s*
                <b>(.*?)</b>\s*
            )?
            (?:<br>\s*)?
            ##sx
        ) {
            push @speakers, [$2, $1, $3];
        }
        if ($speakers) {
            push @speakers, [$speakers, undef, undef];
        }
        push @{$events[$day]}, {
            id => ++$id,
            type => $type,
            room => $type eq 'talk' ? 'Main room' : 'Elsewhere',
            time => $time,
            title => $title,
            talklink => $talklink,
            speakers => \@speakers,
            description => $desc,
            links => $links,
        };
    }
    return \@events;
}

sub process_talk {
    my $fname = shift;
    local $/;
    open(my $fh, '<', $fname) or die "$fname: $!";
    my $talk = <$fh>;
    close ($fh) or die $!;

    $talk =~ s/.*^## [^\n]*\s*//ms;
    $talk =~ s/^Speaker: .*\n+//m;
    $talk =~ s/^Speakers:\s*(^\s*\*\s.*\n)+\n*//mg;
    $talk =~ s/\n*$//;
    $talk =~ s#\n+#<br/>\n#g;
    my @links;
    while ($talk =~ s/\[(.*?)\]\s*\((.*?)\)/$1/s) {
        push @links, [$2, $1];
    }
    return $talk, \@links;
}

sub set_durations {
    my $events = shift;
    foreach my $dayevents (@$events) {
        foreach my $idx (0..scalar(@$dayevents)-1) {
            if ($idx == scalar(@$dayevents) - 1) {
                if ($dayevents->[$idx]{type} eq 'talk') {
                    $dayevents->[$idx]{duration} = '0:15';
                } else {
                    $dayevents->[$idx]{duration} = '2:00';
                }
            } else {
                my $start = $dayevents->[$idx]{time};
                my $end = $dayevents->[$idx+1]{time};
                my ($startH, $startM) = ($start =~ /(\d+):(\d+)/);
                my ($endH, $endM) = ($end =~ /(\d+):(\d+)/);
                my $duration = ($endH * 60 + $endM) - ($startH * 60 + $startM);
                my $durationM = $duration % 60;
                my $durationH = ($duration - $durationM) / 60;
                $dayevents->[$idx]{duration} = sprintf("%02d:%02d", $durationH,
                    $durationM);
            }
        }
    }
}
my $baseurl = 'https://promcon.io';
my $start = DateTime->new(day => 7, month => 11, year => 2019);

my $events = process();
my $days = scalar(@$events);
my $end = $start + DateTime::Duration->new(days => $days - 1);
set_durations($events);

my $startYMD = $start->ymd;
my $endYMD = $end->ymd;
print <<END;
<?xml version="1.0" encoding="UTF-8"?>
<schedule>
  <conference>
    <title>PromCon EU 2019</title>
    <start>$startYMD</start>
    <end>$endYMD</end>
    <days>$days</days>
    <day_change>00:00</day_change>
    <timeslot_duration>00:15</timeslot_duration>
  </conference>
END

foreach my $dayN (1..$days) {
    my $day = $start + DateTime::Duration->new(days => $dayN - 1);
    my $dayYMD = $day->ymd;
    my $dayevents = $events->[$dayN-1];
    print qq(  <day date="$dayYMD" index="$dayN">\n);

    my %rooms;
    foreach my $event (@$dayevents) {
        my $room = $event->{room};
        $rooms{$room} ||= [];
        push @{$rooms{$room}}, $event;
    }

    foreach my $room (sort keys %rooms) {
        print qq(    <room name="$room">\n);
        foreach my $event (@{$rooms{$room}}) {
            my $id = $event->{id};
            my $type = $event->{type};
            my $room = $event->{room};
            my $time = $event->{time};
            my $duration = $event->{duration};
            my $title = $event->{title};
            my $talklink = $event->{talklink};
            my $speakers = $event->{speakers};
            my $description = $event->{description} || "";
            my $links = $event->{links} || [];

            push @$links, [$talklink, 'Talk information, slides, and video.']
            if($talklink);

            my $persons = "";
            foreach my $speaker (@$speakers) {
                my $person = $speaker->[0];
                my $link = $speaker->[1];
                my $org = $speaker->[2];
                $person .= " ($org)" if ($org);
                $persons .= qq(\n          <person>$person</person>);
                push @$links, [$link, $person] if ($link);
            }

            my $linkstr = "";
            foreach my $link (@$links) {
                my ($link, $text) = @$link;
                $link = $baseurl . $link unless($link =~ m#://#);
                $linkstr .= qq(\n          <link href="$link">$text</link>);
            }
            print <<END;
      <event id="$id">
        <start>$time</start>
        <duration>$duration</duration>
        <room>$room</room>
        <abstract/>
        <title>$title</title>
        <type>talk</type>
        <released>True</released>
        <persons>$persons
        </persons>
        <description>$description
        </description>
        <links>$linkstr
        </links>
      </event>
END
        }
        print qq(    </room>\n);
    }
    print qq(  </day>\n);
}
print qq(</schedule>\n);
