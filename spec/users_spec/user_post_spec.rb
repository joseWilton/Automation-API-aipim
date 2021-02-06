require "httparty"
require "./routes/Users/user_routes"
require "helpers"

describe "Post /login" do
    context "Login sucess" do
        
        before(:all) do
           @result = Helpers.login() 
        end

        it "Status code should be 200" do
            expect(@result.code).to eql 200
        end

        it "should have token on body" do
            expect(@result.parsed_response).to have_key("token")
        end
    end

    context "Login with e-mail or password wrong" do   
        before(:all) do
            @result = UserRoutes.new.wrong_login("admin@admin.com", "xablau12345") # rota criada apenas para testar login inválido
         end

         it "Status code should be 400" do
            expect(@result.code).to eql 400
        end
        it "email or password wrong" do
            expect(@result.parsed_response["message"]).to eql "Email ou senha estão incorretos"
        end
    end
end