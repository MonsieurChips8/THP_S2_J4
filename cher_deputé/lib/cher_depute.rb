require 'rubygems'
require 'nokogiri'
require 'open-uri'


############# IMPORTANT !!!!
PAGE_URL = "https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"
############# IMPORTANT !!!!
#

def all_repute_full_name

	page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"))
	
	#
	####  START  SCRAP NOM PRENOM
	full_name_m = []
	page.xpath('//*[@id="content"]/div[1]/ul[1]/li[1]/h2').each do |x|
		full_name_m << x.text
		end	
		
		array_1 = ["first_name","last_name", "email"]
		full_name = []
		full_name_final = []
		
		full_name << full_name_m[0].split[1...3]

		full_name_final << full_name[0][0..2]
		puts full_name_final.inspect
		
	####  FIN  SCRAP NOM PRENOM
	#
	
	#
	####  START  SCRAP MAIL
	liste_mail = []

	page.xpath('//*[@id="content"]/div[1]/ul[1]/li[5]/a[1]').each do |x|
                 liste_mail <<  x["href"][7...50]
         end
	puts liste_mail
	####  FIN  SCRAP MAIL
	#
	
		

	#
	####  START  MERGE HASH	
		a = Hash[array_1.zip(full_name_final[0] << liste_mail[0])]
		puts a

	####  FIN  MERGE HASH
	#
end

#all_repute_full_name


def chain1
page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"))
	
	array = []

	page.xpath('//*[@id="content"]/div[1]/ul').each do |x|
		all_repute_full_name(x)

end
 	puts array
end

chain1














