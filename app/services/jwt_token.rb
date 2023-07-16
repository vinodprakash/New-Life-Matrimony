class JwtToken

    SECRET_KEY = '58b425ad871843c0c4129fcd0cbff14a996e9007b45d7b8c93'.freeze

    def self.encode(payload, exp = 24)
        payload[:exp] = Time.now.to_i + exp * 60 * 60
        JWT.encode payload, SECRET_KEY, 'HS256'
    end

    def self.decode(token)
        decoded_token = JWT.decode token, SECRET_KEY, true, { algorithm: 'HS256' }
        decoded_token[0]['user_id']
    rescue
        nil
    end
end