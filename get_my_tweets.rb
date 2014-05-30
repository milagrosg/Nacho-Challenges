require "rubygems"
require "twitter"

# Twitter API config
client = Twitter::REST::Client.new do |config|
	config.consumer_key = "ypZTEZ6JQybfl0SZfRRRBsVVu"
	config.consumer_secret = "Cmr6Amhxn1OVCV9TlgWecFRrO4BdgScarTpFz35ikGM6xOXEci"
	config.access_token = "54199181-7KtIh2B8dJTt3ZEl8eYbtr78QhM1Wd95ELCpOJdGp"
	config.access_token_secret = "Rj7xJGTkyDSH2OmGr46w4WyUKYXIhK0KnxthP5jJ3DFGj"
end

# Getting tweets from my timeline
last_tweets = client.home_timeline

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
	target.write(tweet.created_at)
	target.write(tweet.text)
	target.write("\n")
end

# Closing file
target.close()