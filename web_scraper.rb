#!/usr/bin/ruby

require 'open-uri'
require 'nokogiri'

case ARGV[0]
when "media"
	puts "Opening"
	open(ARGV[1]) do |media|
		file = open(ARGV[2], 'w')
		puts "Writing"
		file.write(media.read)
		file.close
	end
when "html"
	puts "Opening"
	doc = Nokogiri::HTML(open(ARGV[1]))
	file = open(ARGV[2], 'w')
	puts "Writing"
	file.write(doc)
	file.close
else
	puts "First argument must be 'media' or 'html'"
end

puts "Done"
exit
