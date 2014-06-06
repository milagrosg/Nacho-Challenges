require "bundler"
require "cuba/render"

Bundler.require

Cuba.use Rack::Session::Cookie

Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = "haml"

Cuba.define do 
	
	on get do 
		
		on root do 
			res.redirect "/my_tweets"
		end

		on "my_tweets" do 
			res.write render("views/list_tweets.ham", content: "my tweets")
		end

		on "about" do 
			res.write "About my tweets!"
		end

	end
	
end