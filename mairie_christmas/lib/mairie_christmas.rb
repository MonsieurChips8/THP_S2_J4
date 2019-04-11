require 'rubygems'
require 'nokogiri'
require 'open-uri'


############# IMPORTANT !!!!
PAGE_URL = "https://coinmarketcap.com/all/views/all/"
############# IMPORTANT !!!!
#

townhall_url = "http://www.annuaire-des-mairies.com/95/ermont.html"

def get_townhall_email(townhall_url)

page = Nokogiri::HTML(open("#{townhall_url}"))

ville_name = []
email_1 = []

ville_name << page.xpath('/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a').text
email_1	<< page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

puts ville_name
puts email_1

a = Hash[ville_name.zip(email_1)]
return a

end

#get_townhall_email(townhall_url)



def get_townhall_urls
page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
lien_debut = "http://www.annuaire-des-mairies.com"
liste_lien_villes = []

	page.xpath('//a').each do |x|
                 liste_lien_villes << lien_debut + x["href"][1...35]
         end


 return liste_lien_villes[8..-2]

end

 
get_townhall_urls.each do |o| get_townhall_email(o)

end


