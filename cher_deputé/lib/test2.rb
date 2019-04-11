require 'rubygems'
require 'nokogiri'
require 'open-uri'



############# IMPORTANT !!!!
PAGE_URL = "https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"
############# IMPORTANT !!!!
#

#### CHAIN1 =  PROGRAMME FINI SAUF HASH
def chain1
page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600"))
	
	
	liste_mail = []
	full_name_m = []
	liste_mail_custom = []
	full_name_custom = []

	
		liste_mail << page.xpath('//li[5]/a[1]').text
        full_name_m << page.xpath('//li[1]/h2').text.gsub('Mme ', ' ').gsub('M ', ' ')
		
			
	
		array_1 = ["first_name","last_name", "email"]
		full_name = []
		full_name_final = []

		#full_name << full_name_m[0].split[1...3]
		#full_name_final << full_name[0][0..2]
		
	
		
		#puts liste_mail[0][11...-74].split.length
		

		liste_mail_custom << liste_mail[0][11...-74].split(" ")
		#full_name_final << full_name_m.split('')
		#puts liste_mail_custom[0].class
		full_name_final << full_name_m[0].split(" ").flatten

		#puts liste_mail_custom
		a = Hash[array_1.zip(full_name_final[0])]
		
		puts full_name_final.inspect
		puts liste_mail_custom.inspect
		#puts liste_mail

puts a



end



#### CHAIN1 =  PROGRAMME FINI SAUF HASH

#### ALL REPUTE FULL NAME = PROGRAMME FINI SAUF BOUCLE
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
chain1

#### ALL REPUTE FULL NAME = PROGRAMME FINI SAUF BOUCLE












