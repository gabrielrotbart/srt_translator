require 'srt_translator/frame'

module SrtTranslator
	class FrameReader


		def initialize file
			@file = file 
			@frames = []
		end

		def read_frames
			@file.open do |file|
				frame_no = nil
				frame_timing = nil
				dialog = []
				line_no = 0
				file.each_line do |line|
					if !line.strip.empty?
						line_no += 1
						case line_no
							when 1
								frame_no = line.strip
							when 2
								frame_timing = line.strip
							else
								dialog << line.strip	
						end
					else
						create_frame(frame_no, frame_timing, dialog) if line_no > 0
						line_no = 0
						dialog = []	
					end
				end
			end
			@frames
		end

		def create_frame(frame_no, frame_timing, dialog)
			frame = Frame.new(frame_no, frame_timing, dialog)
			@frames << frame
		end


	end
end