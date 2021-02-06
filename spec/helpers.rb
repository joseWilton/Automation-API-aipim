require "httparty"

class Helpers
    include HTTParty
    base_uri "https://sys-restaurante.herokuapp.com"
    headers "Content-Type" => "application/json"

    def self.get_token()
        "Bearer #{login.parsed_response["token"]}"
    end
    
    def self.login()
        result = post("/account/login", body: { email: "admin@admin.com", password: "123456" }.to_json)
    end

end