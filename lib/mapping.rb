class Mapping

    def initialize(phonenumber)
       @phonenumber = phonenumber
       @mapping_strings = { '2' => %w[a b c],
       	                    '3' => %w[d e f],
       	                    '4' => %w[g h i],
       	                    '5' => %w[j k l],
       	                    '6' => %w[m n o],
       	                    '7' => %w[p q r s],
       	                    '8' => %w[t u v],
       	                    '9' => %w[w x y z]

                          }

    end

    def validate_phone_number?
       if phonenumber.nil?
       	return false
       else	
       @phonenumber = phonenumber.gsub(/[^2-9]/,'')
       return true if @phonenumber.length == 10
       end
    end 

    def get_dictionary_words
       @dictionary_words = []
       File.foreach(Dir.pwd + '/dictionary/dictionary.txt') do |dic_word|
         @dictionary_words << dic_word.strip
       end 
    end  	

    def convert_to_words
       return "Invalid Phone Number" unless validate_phone_number?

       get_dictionary_words
    end	

end