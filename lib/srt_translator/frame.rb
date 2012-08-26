module SrtTranslator
	class Frame

		attr_reader :no, :timing, :dialog

		def initialize(frame_no, frame_timing, dialog)
			@no = frame_no
			@timing = frame_timing
			@dialog = dialog
		end		

	end
end