
$:.unshift File.dirname(__FILE__) 
require 'rubygems'
require 'srt_translator/translator'
require 'srt_translator/configuration'
require 'srt_translator/frame_reader'
require 'srt_translator/frame_writer'


module SrtTranslator

	# class << self

		FROM_LANG = Configuration.from_lang
		TO_LANG = Configuration.from_lang

		def self.translate file_path
			STDOUT.puts "Starting to translate #{file_path}"

			frames = FrameReader.new(file_path).read_frames
			translated_frames = Translator.new(frames).translate
			FrameWriter.new(translated_frames, file_path).write_frames

			STDOUT.puts "Finished translating #{file_path}"
		end

	# end

end

