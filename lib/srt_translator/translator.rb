require 'microsoft_translator'


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
			translator = MicrosoftTranslator::Client.new(@client_id, @client_secret)

			@frames.map! do |frame|
				frame.dialog = frame.dialog.map! do |dialog_line|
					puts '.'
					begin
						translated = translator.translate(dialog_line, @from_lang, @to_lang, "text/plain")
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