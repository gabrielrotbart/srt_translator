require 'pathname'

module SrtTranslator
	class FrameWriter

		def initialize translated_frames, file_path
			@file_path = file_path
			@frames = translated_frames
			create_file
		end

		def create_file
			File.open(file_name(@file_path), 'w') do |file|
				@frames.each do |frame|
					file.write(frame.no + "\n")
					file.write(frame.timing + "\n")
					frame.dialog.each {|line| file.write(line.reverse + "\n")}
					file.write "\n"
				end
			end
		end

		def file_name file_path
			to_lang = Configuration.to_lang

			path = Pathname.new(file_path)
			file_base_path = path.dirname + path.basename(path.extname)
			file_name = "#{file_base_path}.#{to_lang}#{path.extname}"
		end

	end
end