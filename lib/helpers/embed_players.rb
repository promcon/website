def youtube_player(id)
  url = "https://www.youtube.com/embed/#{id}?list=PLoz-W_CUquUlCq-Q0hy53TolAhaED9vm&origin=https://promcon.io"
  container %(<iframe id="ytplayer" type="text/html" src="#{url}" frameborder="0"></iframe></div>)
end

def slideshare_player(code)
  container %(<iframe src="//www.slideshare.net/slideshow/embed_code/key/#{code}" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen></iframe>)
end

def google_slides_player(id)
  container %(<iframe src="https://docs.google.com/presentation/d/#{id}/embed?start=false&loop=false&delayms=3000" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>)
end

def google_drive_player(id)
  container %(<iframe src="https://drive.google.com/file/d/#{id}/preview"></iframe>)
end

def speakerdeck_player(id)
  container %(<script async class="speakerdeck-embed" data-id="#{id}" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>)
end

def container(content)
  %(<div class="iframe-container">#{content}</div>)
end
