require "httparty"
require "./routes/pagers/pager_routes"
require "helpers"

describe "Pager POST methods" do
    context "create a pager" do
        before(:all) do
            token = Helpers.get_token
            @result = PagerRoutes.create_pager("11", "11", "true", token)
         end

         it "Status code should be 200" do
            expect(@result.code).to eql 200
        end
    end
end