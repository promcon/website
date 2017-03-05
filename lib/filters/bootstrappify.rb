# encoding: utf-8

require 'nokogiri'

class Boostrappify < ::Nanoc::Filter
  identifier :bootstrappify

  def run(content, params={})
    doc = Nokogiri::HTML::DocumentFragment.parse(content)
    doc.css('h1').each do |h1|
      h1['class'] = 'page-header'
    end
    doc.css('table').each do |table_node|
      next if table_node['class'] && table_node['class'] =~ /table/
      table_node['class'] = (table_node['class'] || '') + ' table table-bordered'
    end
    doc.to_s
  end
end
