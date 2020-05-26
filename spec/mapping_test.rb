# frozen_string_literal: true


require_relative '../lib/mapping.rb'

describe Mapping do 
  let(:firstphonenumber) {'6686787825'}
  let (:firstresult) {[%w[NOUN STRUCK], %w[ONTO STRUCK], %w[MOTOR TRUCK],
                       %w[MOTOR USUAL], %w[NOUNS TRUCK], %w[NOUNS USUAL], %w[MOT OPT PUCK], 
                       %w[MOT OPT RUCK], %w[MOT OPT SUCK], %w[MOT ORT PUCK], %w[MOT ORT RUCK], 
                       %w[MOT ORT SUCK], %w[NOT OPT PUCK], %w[NOT OPT RUCK], %w[NOT OPT SUCK], 
                       %w[NOT ORT PUCK], %w[NOT ORT RUCK], %w[NOT ORT SUCK], %w[OOT OPT PUCK], 
                       %w[OOT OPT RUCK], %w[OOT OPT SUCK], %w[OOT ORT PUCK], %w[OOT ORT RUCK], 
                       %w[OOT ORT SUCK], %w[MOT OPTS TAJ], %w[MOT OPUS TAJ], %w[MOT ORTS TAJ], 
                       %w[NOT OPTS TAJ], %w[NOT OPUS TAJ], %w[NOT ORTS TAJ], %w[OOT OPTS TAJ], 
                       %w[OOT OPUS TAJ], %w[OOT ORTS TAJ], %w[NOUN PUP TAJ], %w[NOUN PUR TAJ], 
                       %w[NOUN PUS TAJ], %w[NOUN SUP TAJ], %w[NOUN SUQ TAJ], %w[ONTO PUP TAJ], 
                       %w[ONTO PUR TAJ], %w[ONTO PUS TAJ], %w[ONTO SUP TAJ], %w[ONTO SUQ TAJ], 
                       'MOTORTRUCK']}

  let(:secondphonenumber) {'2282668687'}
  let (:secondresult) {[%w[ACT AMOUNTS], %w[ACT CONTOUR], %w[BAT AMOUNTS], %w[BAT CONTOUR], 
                        %w[CAT AMOUNTS], %w[CAT CONTOUR], %w[ACTA MOUNTS], %w[ACT BOO TOTS], 
                        %w[ACT BOO TOUR], %w[ACT CON TOTS], %w[ACT CON TOUR], %w[ACT COO TOTS], 
                        %w[ACT COO TOUR], %w[BAT BOO TOTS], %w[BAT BOO TOUR], %w[BAT CON TOTS], 
                        %w[BAT CON TOUR], %w[BAT COO TOTS], %w[BAT COO TOUR], %w[CAT BOO TOTS], 
                        %w[CAT BOO TOUR], %w[CAT CON TOTS], %w[CAT CON TOUR], %w[CAT COO TOTS], 
                        %w[CAT COO TOUR], %w[ACT BOOT MUS], %w[ACT BOOT NUS], %w[ACT BOOT OUR], 
                        %w[ACT COOT MUS], %w[ACT COOT NUS], %w[ACT COOT OUR], %w[BAT BOOT MUS], 
                        %w[BAT BOOT NUS], %w[BAT BOOT OUR], %w[BAT COOT MUS], %w[BAT COOT NUS], 
                        %w[BAT COOT OUR], %w[CAT BOOT MUS], %w[CAT BOOT NUS], %w[CAT BOOT OUR], 
                        %w[CAT COOT MUS], %w[CAT COOT NUS], %w[CAT COOT OUR], %w[ACTA MOT MUS], 
                        %w[ACTA MOT NUS], %w[ACTA MOT OUR], %w[ACTA NOT MUS], %w[ACTA NOT NUS], 
                        %w[ACTA NOT OUR], %w[ACTA OOT MUS], %w[ACTA OOT NUS], %w[ACTA OOT OUR], 
                        'CATAMOUNTS']}


    context 'Testing mapping of phone number to words' do
       it 'Check valid phone number' do
        puts 'Phone number is' + firstphonenumber
        mapphno = Mapping.new(firstphonenumber)
        expect(mapphno.validate_phone_number?).to be(true)
       end

       it 'Test output having multiple combinations of mapping words' do
         mapphno = Mapping.new(firstphonenumber)
         expect(mapphno.convert_to_words)
       end
    end

    context 'Testing mapping of phone number to words' do
       it 'Check valid phone number' do
        puts 'Phone number is' + secondphonenumber
        mapphno = Mapping.new(secondphonenumber)
        expect(mapphno.validate_phone_number?).to be(true)
       end

       it 'Test output having multiple combinations of mapping words' do
         mapphno = Mapping.new(secondphonenumber)
         expect(mapphno.convert_to_words)
       end
    end
end
