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

all_repute_full_name





def boucle_info(array)

var10 = array.length
var11 = 0
name_depute = []
	while var10 > 0
		if name_depute
		name_depute << array[var11][22..54]
		var10 -= 1
		var11 += 1
	end
	end
	puts name_depute
end
#boucle_info(chain1)



def chain1
page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"))
	
	
	liste_mail = []
	full_name_m = []
	liste_mail_custom = []
	full_name_custom = []

	
		liste_mail << page.xpath('//li[5]/a[1]').text
        full_name_m << page.xpath('//li[1]/h2').text
		
			
	
		array_1 = ["first_name","last_name", "email"]
		full_name = []
		full_name_final = []

		#full_name << full_name_m[0].split[1...3]
		#full_name_final << full_name[0][0..2]
		
	
		
		#puts liste_mail[0][11...-74].split.length
		

		full_name << full_name_m[0].split("Mme ")
		

		liste_mail_custom << liste_mail[0][11...-74].split(" ")

		#puts liste_mail_custom
		puts full_name[0]

		#puts liste_mail




end

#chain1


