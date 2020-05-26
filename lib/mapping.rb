class Mapping
   attr_reader :phone_number

   def initialize(phone_number)
     @phone_number = phone_number
     @mapping_strings = {'2' => %w[A B C],
                        '3' => %w[D E F],
                        '4' => %w[G H I],
                        '5' => %w[J K L],
                        '6' => %w[M N O],
                        '7' => %w[P Q R S],
                        '8' => %w[T U V],
                        '9' => %w[W X Y Z] }

     @converted_words = []                   
   end   

   def validate_phone_number?
     return false if phone_number.nil?
     
     @phone_number = phone_number.gsub(/[^2-9]/, '')
     return true if @phone_number.length == 10
  end

  def get_mapping_words(phnowordsarrys)
    matches = []
    phnowordsarrys.each do |phno_words|
      matching_words = phno_words.shift.product(*phno_words).map(&:join)
      matching_words.reject! { |x| x.length < 3}
      matches << (matching_words & @dictionary_words)
   end   
    return if matches.any?(&:empty?)

    if matches.size == 2
       @converted_words += matches[0].product(matches[1])
     elsif matches.size == 3
      @converted_words += matches[0].product(matches[1]).product(matches[2]).map(&:flatten)
    end
  end 

  def get_dictionary_words
    @dictionary_words = []
    File.foreach(Dir.pwd + '/dictionary/dictionary.txt') do |word|
      @dictionary_words << word.strip

    end
  end


  def convert_to_words
     return unless validate_phone_number?

     get_dictionary_words
     length = @phone_number.length
     i = 2
     @map_words = @phone_number.chars.map { |n| @mapping_strings[n] }
     while i < (length - 3)
       fstphnoarry = @map_words[0..i]
       secphnoarry = @map_words[(i + 1)..(length - 1)]
       get_mapping_words([fstphnoarry, secphnoarry])
       i += 1
     end
    get_mapping_words([@map_words[0..2], @map_words[3..5], @map_words[6..9]])
    get_mapping_words([@map_words[0..2], @map_words[3..6], @map_words[7..9]])
    get_mapping_words([@map_words[0..3], @map_words[4..6], @map_words[7..9]])
    @converted_words << (@map_words.shift.product(*@map_words).map(&:join) & @dictionary_words).join(', ') 
    @converted_words.uniq!
    @converted_words.reject! { |x| x.join.length < 10 if x.is_a?(Array) || x.length < 10 }
    @converted_words
  end

end