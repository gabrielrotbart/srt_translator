$KCODE = "UTF-8"
require 'spec_helper'


describe SrtTranslator::Translator do

	before :each do
		@frame = mock(SrtTranslator::Frame)
		@frame.should_receive(:dialog).and_return(['Just tacky enough','good'])
	end

	it 'should return a translated line' do

		frames = [@frame]

		translation = SrtTranslator::Translator.new(frames).translate

		translation.first.should == ['רק קיטשי מספיק','טוב']
		
	end

end	


