# encoding: utf-8
$KCODE = "UTF-8"

require 'spec_helper'


describe SrtTranslator::Translator do

	before :each do
		@frame = SrtTranslator::Frame.new("580", "00:39:52,725 --> 00:39:54,018", ['Just tacky enough?','-good!', 'continue...', '<i>italics</i>'])
	end

	it 'should return a translated line' do

		frames = [@frame]

		translation = SrtTranslator::Translator.new(frames).translate

		translation.first.dialog.should == ["?פשוט זול מספיק", "!טוב-", "...תמשיך ", "<i>אותיות מוטות</i>"]
		
	end

end	


