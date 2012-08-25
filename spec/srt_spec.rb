require 'spec_helper'

describe '.srt translator' do
	
	it 'should parse srt frames' do
		
			srt_paragraph = 
			"
				630\n
				00:43:07,250 --> 00:43:08,539\n
				- Just tacky enough.\n
				- Good.\n

				
				624\n
				00:42:46,024 --> 00:42:47,650\n
				Watch closely.\n
				
			"

			file = 'dummy.srt'
			File.should_receive(:open).and_return(srt_paragraph)

			frames = FrameReader.new(file)

			frames.size.should == 2
			frames.first.position.should == "630\n"
			frames.first.timing.should == "00:43:07,250 --> 00:43:08,539\n"
			frames.first.dialog.should == ["- Just tacky enough.\n","- Good.\n"]
		
		
	end


end