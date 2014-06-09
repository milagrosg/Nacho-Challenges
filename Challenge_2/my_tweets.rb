require "bundler"
require "cuba/render"

Bundler.require

Dotenv.load 

Cuba.use Rack::Session::Cookie

Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = "haml"

#Twitter API setup
client = Twitter::REST::Client.new do |config|
	config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
	config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
	config.access_token = ENV['TWITTER_ACCESS_TOKEN']
	config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

Cuba.define do 
	
	on get do 
		
		on root do 
			res.redirect "/my_tweets"
		end

		on "my_tweets" do
			
			last_tweets = client.home_timeline(:count => 25)
			
			res.write render("views/list_tweets.haml", :content => last_tweets) 
		
		end

		on "about" do 
			res.write "About my tweets!"
		end

	end
	
end