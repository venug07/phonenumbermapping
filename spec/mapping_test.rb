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


end