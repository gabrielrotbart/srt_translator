require 'srt_translator'

class Translator

	def intialize srt_file, from_lang, to_lang
		@srt_file = srt_file
		@from_lang = from_lang
		@to_lang = to_lang
		@client_id = Configuration.client_id
		@client_secret = Configuration.client_secret
	end



end