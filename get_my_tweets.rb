require "rubygems"
require "twitter"

# Twitter API config
client = Twitter::REST::Client.new do |config|
	config.consumer_key = "ypZTEZ6JQybfl0SZfRRRBsVVu"
	config.consumer_secret = "Cmr6Amhxn1OVCV9TlgWecFRrO4BdgScarTpFz35ikGM6xOXEci"
	config.access_token = "54199181-7KtIh2B8dJTt3ZEl8eYbtr78QhM1Wd95ELCpOJdGp"
	config.access_token_secret = "Rj7xJGTkyDSH2OmGr46w4WyUKYXIhK0KnxthP5jJ3DFGj"
end

# Getting first tweet from my timeline
last_tweets = client.home_timeline.first.text

# Printing tweet
puts "This is the first tweets: #{last_tweets}"

# Creating / Opening file in write mode
target = File.open("tweets.txt", 'w')

# Writing tweets to file  
target.write(last_tweets)

# Closing file
target.close()