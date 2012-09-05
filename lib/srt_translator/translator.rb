require 'to_lang'


module SrtTranslator
	class Translator

		def initialize frames
			@frames = frames

			@from_lang = Configuration.from_lang
			@to_lang = Configuration.to_lang
			@client_id = Configuration.client_id
			@client_secret = Configuration.client_sercret
		end

		def translate
			ToLang.start('AIzaSyDkQu1h0eRUd3--hdsbogrrN-Wt2vyz7SI')
			# translator = MicrosoftTranslator::Client.new(@client_id, @client_secret)

			@frames.map! do |frame|
				frame.dialog = frame.dialog.map! do |dialog_line|
					puts '.'
					begin
						translated = dialog_line.to_hebrew
						reversed = reverse_punctuation(translated)
						reversed
					rescue
						puts "Rescued: " + dialog_line
						dialog_line
					end
				end
				frame
			end
		end

		protected

		def reverse_punctuation(text)
			text.scan(/[[[:alnum:]][[:space:]]\<\>\/]+[\.\,]*[[[:alnum:]][[:space:]]\<\>\/]+|[^[[:alnum:]]]+/).reverse.join
		end

	end
end	