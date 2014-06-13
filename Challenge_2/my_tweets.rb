require "bundler"
require "cuba/render"

Bundler.require

Dotenv.load 

Cuba.use Rack::Session::Cookie, :secret => ENV['SECRET_TOKEN']

Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = "haml"

Cuba.use Rack::Static,
  urls: %w[/js /css /img],
  root: File.expand_path("./public", __dir__)

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
			#res.redirect "/my_tweets"
			res.write render("views/home.haml")
		end

		on "my_tweets" do
			
			last_tweets = client.home_timeline(:count => 25)
			
			res.write render("views/list_tweets.haml", :content => last_tweets) 
		
		end

		on "tweeting" do 
			res.write render("views/new_tweet.haml")

		end

		on "bootstrap_test" do 
			res.write render("views/test_bootstrap.html", :twitter_client => client)
		end

		on "about" do 
			res.write "About my tweets!"
		end

	end

	on post do 
		on "tweeting" do
			on param("tweet") do |tweet|
				res.write tweet

				client.update(tweet)
			end

		# If there is no input, this block will be excecuted. 

			on true do
				res.write "You need to provide a tweet!"
			end
		end
	end
end