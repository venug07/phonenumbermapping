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
      @mapwords = []                    

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
      tot_length = @phonenumber.length - 3
      min_length = 2
      @mapwords = @phonenumber.chars.map { |phno| @mapping_strings[phno] }
      while min_length < tot_length
         fstphnoarray = @mapwords[0..i]
         secphnoarray = @mapwords[(min_length + 1)..(tot_length - 1)]
         get_mapping_words([fstphnoarray,secphnoarray]) 
         min_length += 1  
      end	
    end	

   def get_mapping_words(phnowordsarrys)
      matchwords = []
      phnowordsarrys.each do |phnowords|
        matching_words = phnowords.shift.product(*phnowords).map(&:join)
        matching_words.reject! {|pn| pn.length < 3}
        matchwords << (matching_words & @dictionary_words)
      end 

      return if matchwords.any?(&:empty?)

      if matchwords.size == 2
        @mapwords += matchwords[0].product(matches[1])
      elsif matchwords.size == 3
      	@mapwords += matches[0].product(matches[1]).product(matches[2]).map(&:flatten)
      end  	 		 	
   end	

end