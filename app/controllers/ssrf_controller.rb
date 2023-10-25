class SsrfController < ApplicationController
 def index
   conn = Faraday.new("https://api.github.com/user/")
   user_id= params[:user_id]
   resp = conn.get(user_id, {}, fake_authorization: "Bearer my_secret_token") 
   render plain: "GET #{resp.env.url} with headers #{resp.env.request_headers} returned:\n\n#{resp.body}"
 end
end
