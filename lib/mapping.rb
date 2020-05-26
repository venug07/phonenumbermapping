class Mapping
  attr_reader :phonenumber

#Assigning phone number variables and mapping to words
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
      @convertedwords = []                    

    end

#Validating phone number empty or having 10 digits
    def validate_phone_number?
       if phonenumber.nil?
       	return false
       else	
       @phonenumber = phonenumber.gsub(/[^2-9]/,'')
       return true if @phonenumber.length == 10
       end
    end 


#Getting words from dictionary
    def get_dictionary_words
       @dictionary_words = []
       File.foreach(Dir.pwd + '/dictionary/dictionary.txt') do |dic_word|
         @dictionary_words << dic_word.strip
       end 
    end  	

#Converting phone number to words
#Dividing length wise and getting combinations
    def convert_to_words
      return "Invalid Phone Number, Please enter again" unless validate_phone_number?

      get_dictionary_words
      tot_length = @phonenumber.length
      min_length = 2
      @mapwords = @phonenumber.chars.map { |phno| @mapping_strings[phno] }
      while min_length < (tot_length - 3)
         fstphnoarray = @mapwords[0..min_length]
         secphnoarray = @mapwords[(min_length + 1)..(tot_length - 1)]
         get_mapping_words([fstphnoarray, secphnoarray]) 
         min_length += 1  
      end	
      get_mapping_words([@mapwords[0..2], @mapwords[3..5], @mapwords[6..9]])
      get_mapping_words([@mapwords[0..2], @mapwords[3..6], @mapwords[7..9]])
      get_mapping_words([@mapwords[0..3], @mapwords[4..6], @mapwords[7..9]])

      @convertedwords << (@mapwords.shift.product(*@mapwords).map(&:join) & @dictionary_words).join(', ')
      @convertedwords.uniq!
      @convertedwords.reject! { |phn| phn.join.length < 10 if phn.is_a?(Array) || phn.length < 10 }
      @convertedwords
    end	

#Getting matching words from dictionary for all combinations
   def get_mapping_words(phnowordsarrys)
      matchwords = []
      phnowordsarrys.each do |phnowords|
        matching_words = phnowords.shift.product(*phnowords).map(&:join)
        matching_words.reject! {|pn| pn.length < 3}
        matchwords << (matching_words & @dictionary_words)
      end 

      return if matchwords.any?(&:empty?)

      if matchwords.size == 2
        @convertedwords += matchwords[0].product(matchwords[1])
      elsif matchwords.size == 3
      	@convertedwords += matchwords[0].product(matchwords[1]).product(matchwords[2]).map(&:flatten)
      end	 		 	
   end



end

puts 'Please enter the 10 digit phone number :'
phonenumber = gets.chomp
mapphno = Mapping.new(phonenumber)
puts mapphno.convert_to_words
