require 'digest/sha1'

module CacheBuster
  def self.fingerprint(item)
    return 'dev' if ENV['NANOC_ENV'] == 'dev'

    content = item.binary? ? File.read(item[:filename]) : item.raw_content
    Digest::SHA1.hexdigest(content)[0..15]
  end

  def self.path(item)
    item.identifier.without_ext + '-' + fingerprint(item) + '.' + item.identifier.ext
  end

  class Filter < ::Nanoc::Filter
    identifier :cache_buster

    def run(content, options = {})
      dir = options[:directory] || File::Separator
      regex = options[:regex] || regex(dir)
      replacements = path_replacements(File.join(dir, '**', '*'))

      content.gsub(regex) do |match|
        replacements[match] || match
      end
    end

    private

    def regex(dir)
      dir += File::Separator unless dir.end_with?(File::Separator)
      parts = [dir, "([^\"'#{File::Separator}]+#{File::Separator})*", "[^\"'#{File::Separator}]+"]
      puts parts.join('')
      /#{parts.join('')}/
    end

    def path_replacements(pattern)
      @_path_replacements ||= {}
      @_path_replacements[pattern] = begin
        items.find_all(pattern).each_with_object({}) do |item, memo|
          memo[item.identifier.to_s] = item.path
        end
      end
    end
  end
end
