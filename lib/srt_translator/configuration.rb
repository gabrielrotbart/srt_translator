module SrtTranslator
	module Configuration

		attr_accessor :client_id, :client_sercret

		def self.client_id
			'rotsrt'
		end

		def self.client_sercret
			's1s2s3s4s5s6s7s8s9s0'
		end

		def self.from_lang
			'en'
		end

		def self.to_lang
			'he'
		end

	end
end
