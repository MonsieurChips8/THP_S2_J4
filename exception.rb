

begin
  # Any exceptions in here... 
  1/0
rescue
  # ...will cause this code to run
  puts "Got an exception, but I'm responding intelligently!"
  do_something_intelligent()
end

# This program does not crash.
# Outputs: "Got an exception, but I'm responding intelligently!"
# 
# 
#   -------------


# Rescues all errors, an puts the exception object in `e`
rescue => e

# Rescues only ZeroDivisionError and puts the exception object in `e`
rescue ZeroDivisionError => e

	puts "Exception Class: #{ e.class.name }"
	puts "Exception Message: #{ e.message }"
	puts "Exception Backtrace: #{ e.backtrace }"




# -------  OWN EXCEPTIONS !!

begin
  # raises an ArgumentError with the message "you messed up!"
  raise ArgumentError.new("You messed up!")
rescue ArgumentError => e  
  puts e.message
end

# Outputs: You messed up! 
# 
# 
# 
# 
 
 
 
 
