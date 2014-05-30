require "rubygems"
require "twitter"
require "csv"

# Twitter API config
client = Twitter::REST::Client.new do |config|
	config.consumer_key = "ypZTEZ6JQybfl0SZfRRRBsVVu"
	config.consumer_secret = "Cmr6Amhxn1OVCV9TlgWecFRrO4BdgScarTpFz35ikGM6xOXEci"
	config.access_token = "54199181-7KtIh2B8dJTt3ZEl8eYbtr78QhM1Wd95ELCpOJdGp"
	config.access_token_secret = "Rj7xJGTkyDSH2OmGr46w4WyUKYXIhK0KnxthP5jJ3DFGj"
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
