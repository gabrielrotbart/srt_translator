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
				frame.dialog.map! do |dialog_line|
					puts '.'
					begin
						translator.translate(dialog_line, @from_lang, @to_lang, "text/plain")
					rescue
						puts dialog_line
						dialog_line
					end
				end
			end

			@frames
		end

	end
end	