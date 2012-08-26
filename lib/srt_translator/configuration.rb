module SrtTranslator
	module Configuration

		attr_accessor :client_id, :client_sercret

		def self.client_id
			ENV('CLIENT_ID') =|| 'rotsrt'
		end

		def self.client_sercret
			ENV('CLIENT_SECRET') =|| 's1s2s3s4s5s6s7s8s9s0'
		end

		def self.from_lang
			ENV('FROM_LANG') ||= 'en'
		end

		def self.to_lang
			ENV('TO_LANG') ||= 'he'
		end

	end
end
