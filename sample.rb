require 'rubygems'
require 'tweetstream'
require 'json'

api = JSON.load(open(ENV['HOME'] + '/.apikeys.js'))

TweetStream.configure do |config|
  config.consumer_key = api['gft']['c_key']
  config.consumer_secret = api['gft']['c_secret']
  config.oauth_token = api['gft']['a_token']
  config.oauth_token_secret = api['gft']['a_secret']
  config.auth_method = :oauth
  config.parser   = :yajl
end

# This will pull a sample of all tweets based on
# your Twitter account's Streaming API role.
TweetStream::Client.new.track('#northlift', '#southlift') do |status|
    x = status.to_json
    puts "json=#{x.length} text=#{status.text.length}"
    p x
end
