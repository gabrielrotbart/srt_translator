#!/usr/bin/env ruby

require 'srt_translator/configuration'
require 'srt_translator/translator'


module SrtTranslator

	class << self

		def initialize file_path
			@file_path = file_path
		end

		FROM_LANG = Configuration.from_lang
		TO_LANG = Configuration.from_lang

		def translate file
			frames = FrameReader.new(file).read_frames
			translated_frames = Translator.new(frames)
			file = FrameWriter.new(translated_frames, file_path)
		end

	end

end

SrtTranslator.new(ARGV[0])