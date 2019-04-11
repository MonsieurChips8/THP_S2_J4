require 'pry'		# DEBBUG
require 'dotenv' 	# API
Dotenv.load('.env') # API load dotenv


#Ne pas oublier de bundle intall pour valider les gems
# 
#

puts ENV['TWITTER_API_KEY']
puts ENV