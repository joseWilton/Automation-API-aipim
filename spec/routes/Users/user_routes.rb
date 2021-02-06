require "httparty"

class UserRoutes
    include HTTParty
    base_uri "https://sys-restaurante.herokuapp.com"
    
    def wrong_login(email, pass)
        payload = { email: email, password: pass }

        return self.class.post(
            "/account/login",
            body: payload.to_json,
            headers: {
                "Content-Type": "application/json"
            },
        )
    end
end