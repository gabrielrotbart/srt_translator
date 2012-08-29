# encoding: utf-8

require 'spec_helper'
require 'fakefs/safe'
require 'fakefs/spec_helpers'

describe SrtTranslator::FrameWriter do
	include FakeFS::SpecHelpers

	it 'should create a file from translated frames' do
		frame_mock = mock('Frame') 
		frame_mock.should_receive(:no).and_return('111')
		frame_mock.should_receive(:timing).and_return('4:20:00')
		frame_mock.should_receive(:dialog).and_return('[-הגשם בספרד.],[נופל בעיקר במישור?]')

		

		frames = [frame_mock]
		

		FakeFS.activate!
			file_path = 'some/path/test.srt'
  			SrtTranslator::FrameWriter.new(frames,file_path).create_file
		FakeFS.deactivate!

	end
	
	
end