require 'dotenv'

Dotenv.load

require "rubygems"
require "twitter"
require "csv"

# Twitter API setup
client = Twitter::REST::Client.new do |config|
	config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
	config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
	config.access_token = ENV['TWITTER_ACCESS_TOKEN']
	config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

# Getting tweets from my timeline
last_tweets = client.home_timeline(options = {:count => 10})

# Printing tweets
puts "This is the list of tweets:"

last_tweets.each do |tweet|
	puts "Username: #{tweet.user.name}"
	puts "Tweet: #{tweet.text}"
	puts "Date: #{tweet.created_at}\n"
end

# Writing tweets to a CSV file. One entry per each line.  
CSV.open("~tweets.csv", "w") do |csv|
	last_tweets.each do |tweet|
	csv << ["Username: #{tweet.user.name}", "Tweet: #{tweet.text}", "Date: #{tweet.created_at}"]	
	end
end
