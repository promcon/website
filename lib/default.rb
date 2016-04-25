# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Rendering
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging

require 'nanoc/cachebuster'
include Nanoc::Helpers::CacheBusting
