require 'microsoft_translator'
require 'srt_translator/configuration'
require 'srt_translator/translator'
require 'fileutils'

module SrtTranslator

	class << self


		def initialize srt_file
			@srt_file = srt_file
			@srt_file_path = srt_file.dirname
		end

		FROM_LANG = Configuration.from_lang
		TO_LANG = Configuration.from_lang

		def translate file
			frames_array = FrameReader.read_frames(file)
			translated_frames = Translator.new(frames_array, FROM_LANG, TO_LANG)
			translated_files = FrameWriter.new(translated_frames)
		end

		def create_backup	
			srt_backup = (File.join(@srt_file_path,"#{@srt_file.basename}_backup.srt")
			srt_backup.write
		end

		def create_translated_file
			translated_file = translate(@srt_file)
			translated_file.write(File.join(@srt_file_path,@srt_file))
		end

	end

end