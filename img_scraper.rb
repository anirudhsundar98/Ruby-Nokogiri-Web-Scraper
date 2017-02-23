# Scrapes all images from a given page
# Command line arguments : website_url

require "open-uri"
require "nokogiri"
count = 1

if ARGV[0]
	puts "Loading"
	html = Nokogiri::HTML(open(ARGV[0]))
	puts "Loaded\n\n"
	srcs = html.css("img")

	srcs.each do |img_tag|
		puts "Opening #{count}"
		open(img_tag['src']) do |img|
			img_name = img_tag['src'].split("/")
			img_name = img_name[img_name.length-1]

			file = open(img_name, 'w')
			puts "Writing"
			file.write(img.read)
			file.close
			puts "Done\n\n"
			count += 1
		end
	end
end