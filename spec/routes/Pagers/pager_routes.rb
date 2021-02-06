require "httparty"

class PagerRoutes
    include HTTParty
    base_uri "https://sys-restaurante.herokuapp.com"
    headers "Content-Type" => "application/json"

    def self.create_pager(code, restaurant_id, queue, token)
        payload = { code: code, restaurant_id: restaurant_id, queue: queue }
        post("/pagers",body: payload.to_json,headers: {"Authorization" => "#{token}"})
    end
end