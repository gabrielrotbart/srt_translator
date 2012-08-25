module SrtTranslator
	module Configuration

		attr_accessor :client_id, :client_sercret

		def client_id
			@client_id = 'rotsrt'
		end

		def client_sercret
			@client_sercret = 's1s2s3s4s5s6s7s8s9s0'
		end

		def from_lang
			@from_lang = 'en'
		end

		def to_lang
			@to_lang = 'he'
		end

	end
end
