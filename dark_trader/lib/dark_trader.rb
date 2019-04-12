require 'rubygems'
require 'nokogiri'
require 'open-uri'


############# IMPORTANT !!!!
PAGE_URL = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 
############# IMPORTANT !!!!
#


# CURRENCY_RATE =  Programme pour sortir les Nom de crypto monnaie 
# et les associer à leur valeur dans un Hash
# 
def currency_rate
   page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 
    currency_price = []
    currency_name = []

# BOUCLE : 
    page.xpath('//a').each do |x|

         if     x.to_s.include?('class="currency-name-container link-secondary"')
                 currency_name << x.text

         elsif    x.to_s.include?('class="price"')
                 currency_price << x.text
         end    
    end
# FIN BOUCLE

#Création Hash
a = Hash[currency_name.zip(currency_price)]
puts a

end

currency_rate







