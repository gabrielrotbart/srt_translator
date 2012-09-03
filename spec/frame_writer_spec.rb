# encoding: utf-8

require 'spec_helper'

describe SrtTranslator::FrameWriter do
	before :each do
		frame = SrtTranslator::Frame.new("580", "00:39:52,725 --> 00:39:54,018", ['?רק קיטשי מספיק','טוב -'])
		@frames = []
		@frames << frame << frame
	end

	it 'should create a file from translated frames' do
		testStream = StringIO.new
		SrtTranslator::FrameWriter.new(@frames, "some/path", testStream).write_frames
		testStream.string.should == "580
00:39:52,725 --> 00:39:54,018
?רק קיטשי מספיק
טוב -

580
00:39:52,725 --> 00:39:54,018
?רק קיטשי מספיק
טוב -

"
	end
	
	
end