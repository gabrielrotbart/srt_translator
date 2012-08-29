require 'spec_helper'

describe SrtTranslator::FrameReader do

	before :each do
		frame_to_read = "
			630
			00:43:07,250 --> 00:43:08,539
			- Just tacky enough.
			- Good.
		"

		@file_mock = mock(File)
		Pathname.stub(:new).and_return(@file_mock)
		@file_mock.should_receive(:open).and_yield(frame_to_read)
	end

	it 'should create a frame' do

		frames_array = SrtTranslator::FrameReader.new(@file_mock).read_frames
		frames_array.size.should == 1

		frame = frames_array.first
		frame.class.should == SrtTranslator::Frame
		frame.no.should == '630'
		frame.timing.should == '00:43:07,250 --> 00:43:08,539'
		frame.dialog.size.should == 2
		frame.dialog.first.should == '- Just tacky enough.'

	end

end