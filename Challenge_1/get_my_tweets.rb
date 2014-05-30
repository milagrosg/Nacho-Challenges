require 'dotenv'

Dotenv.load

require "rubygems"
require "twitter"

#Twitter API setup
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
	puts "#{tweet.created_at}"
	puts "#{tweet.text}\n"
end

# Creating / Opening file in write mode
target = File.open("tweets.txt", 'w')

# Writing tweets to file  
last_tweets.each do |tweet|
	target.write "Date: #{tweet.created_at} " + "Tweet: #{tweet.text}\n"
end

# Closing file
target.close()

