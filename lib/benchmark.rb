require_relative 'mapping.rb'
puts 'Please enter the 10 digit mobile number :'
puts phone_number = '6686787825' # gets.chomp
mapphno = Mapping.new(phone_number)
p mapphno.convert_to_words