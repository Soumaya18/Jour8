require 'twitter'
require 'dotenv'
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV ['key']
  config.consumer_secret     = ENV ['secret']
  config.access_token        = ENV ['token']
  config.access_token_secret = ENV ['token_secret']
end
p client

client.update('Mon premier tweet en ruby !!!!')



topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
