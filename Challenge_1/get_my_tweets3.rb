require 'dotenv'

Dotenv.load

require "twitter"
require "csv"

# Twitter API config
client = Twitter::REST::Client.new do |config|
	config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
	config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
	config.access_token = ENV['TWITTER_ACCESS_TOKEN']
	config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

# Getting usernames from command line
users = ARGV

if ARGV[0] != nil
	puts "#{users}"

	# Navigating throw users array and getting tweets from each user's timeline
	users.each do |user|
		last_tweets = client.user_timeline("#{user}", options = {:count => 10})

		last_tweets.each do |tweet|
			puts "Username: #{tweet.user.name}"
			puts "Tweet: #{tweet.text}"
			puts "Date: #{tweet.created_at}\n"
		end
	end 

# Writing tweets to a CSV file. One entry per each line.  

	CSV.open("~tweets2.csv", "w") do |csv|
		users.each do |user|
			last_tweets = client.user_timeline("#{user}", options = {:count => 10})

			last_tweets.each do |tweet|
				csv << ["Username: #{tweet.user.name}", "Tweet: #{tweet.text}", "Date: #{tweet.created_at}"]	
			end
		end
	end

elsif 
	puts "No usernames had been passed along. Try again!"
end 