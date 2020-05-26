MAPPING PHONE NUMBERS TO WORDS
--------------------------------

BENCHMARK TESTING
-------------------

time ruby lib/benchmark.rb 


For testing different inputs, In benchmark.rb change this line to

puts phone_number = '6686787825' 

to

puts phone_number = gets.chomp

After that run the command again, It will ask to enter phone number.

RSPEC TESTING
---------------------

rspec spec/mapping_test.rb --format documentation

