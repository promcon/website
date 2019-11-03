#!/bin/sh

# Download list of videos from playlist and generate markdown fragments.

PLAYLIST_ID=$1
[ -n "PLAYLIST_ID" ] || exit 1

youtube-dl -j https://www.youtube.com/playlist?list=$PLAYLIST_ID | \
    jq '.id + " " + .title' |
    sed 's!^"\(\S\+\) \(.*\)"$!## \2\n\n<%= youtube_player("\1") %>\n\n[Video link](https://youtu.be/\1) -\n\n!'
