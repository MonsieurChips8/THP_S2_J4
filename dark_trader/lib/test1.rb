require 'rubygems'
require 'nokogiri'
require 'open-uri'


############# IMPORTANT !!!!
PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"
page = Nokogiri::HTML(open("http://en.wikipedia.org/")) 
############# IMPORTANT !!!!


doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))


#  Find all "a" tags with a parent tag whose name is "h3"
	doc.xpath('//h3/a').each do |node|
	  puts node.text
	end
#  Find all "a" tags with a parent tag whose name is "h3"

#
#### AFFICHER LE CODE HTML DE LA PAGE: 
=begin  
puts page 								# PUTS PAGE HTML CODE
puts page.css('title')					# PUTS CSS: TITLE
puts page.css("title")[0].name   		# => title
puts page.css("title")[0].text   		# => My webpage

puts page.css('li') 					# PUTS ALL LI ELEMENTS
puts page.css('li')[0].text				# PUTS LI > 1e ELEMENT > TEXTE
puts page.css('li')[1]['href']			# PUTS LI > 2e ELEMENT > LIEN
puts page.css("li[data-category='news']")  		# PUTS LI > DATA CAT = news

puts page.css('div#funstuff') 			# PUTS ALL DIV = funstuff
puts page.css('div#reference a') 		# PUTS DIV = reference > a



####
#

=end




//*[@id="id-bitcoin"]/td[2]










