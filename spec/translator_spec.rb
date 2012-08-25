require 'spec_helper'


describe SrtTranslator::Translator do

	it 'should return a translated line' do

		output_lang = 'he'

		line = 'Just tacky enough'

		translation = subject.translate_line line

		translation.first.should == 'קיפסמ ישטיק קר'
		
	end

end	


